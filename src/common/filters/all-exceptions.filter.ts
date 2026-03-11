import {
  ExceptionFilter,
  Catch,
  ArgumentsHost,
  HttpException,
  HttpStatus,
  Logger,
} from '@nestjs/common';
import type { Request, Response } from 'express';
import { ZodError } from 'zod';

type Primitive = string | number | boolean | null | undefined;

@Catch()
export class AllExceptionsFilter implements ExceptionFilter {
  private readonly logger = new Logger(AllExceptionsFilter.name);
  private readonly isProd = (process.env.NODE_ENV ?? '').toLowerCase() === 'production';

  catch(exception: unknown, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const req = ctx.getRequest<Request>();
    const res = ctx.getResponse<Response>();

    const status =
        exception instanceof HttpException
            ? exception.getStatus()
            : exception instanceof ZodError
                ? HttpStatus.BAD_REQUEST
                : HttpStatus.INTERNAL_SERVER_ERROR;

    const normalized = this.normalizeException(exception);
    const now = new Date().toISOString();

    const requestId =
        (req.headers['x-request-id'] as string) ||
        (req.headers['x-correlation-id'] as string) ||
        (req as any).id; // some frameworks attach req.id

    const payload = {
      timestamp: now,
      statusCode: status,
      error: normalized.name,
      message: normalized.message, // string | string[] | object
      path: req.originalUrl || req.url,
      method: req.method,
      requestId,
      // include details helpful for debugging (non-sensitive)
      details: {
        exceptionCode: normalized.code,
        cause: normalized.cause,
      },
      // only include stack in non-production
      ...(this.isProd ? {} : { stack: normalized.stack }),
    };

    // Structured log (single line JSON for log aggregators)
    this.logger.error(JSON.stringify({
      logType: 'http_exception',
      ...payload,
      // handy to see selected request context, with redaction
      request: {
        ip: req.ip,
        userAgent: req.get('user-agent'),
        query: req.query,
        body: this.redactBody(req.body),
      },
    }));

    res.status(status).json(payload);
  }

  private normalizeException(exception: unknown): {
    name: string;
    message: Primitive | Primitive[] | Record<string, unknown>;
    code?: string | number;
    cause?: string;
    stack?: string[];
  } {
    // ZodError: validation error — return 400 with field-level details
    if (exception instanceof ZodError) {
      return {
        name: 'ValidationError',
        message: exception.errors.map(e => `${e.path.join('.')}: ${e.message}`).join('; '),
        code: 'VALIDATION_ERROR',
        cause: undefined,
        stack: this.stackLines(exception),
      };
    }

    // HttpException: preserve its response (could be string or object)
    if (exception instanceof HttpException) {
      const resp = exception.getResponse(); // string | object
      const message =
          typeof resp === 'string'
              ? resp
              : (resp as any)?.message ?? resp;

      return {
        name: exception.name,
        message,
        code: (resp as any)?.code ?? (exception as any)?.code,
        cause: this.extractCause(exception),
        stack: this.stackLines(exception),
      };
    }

    // Generic Error
    if (exception instanceof Error) {
      return {
        name: exception.name || 'Error',
        message: exception.message || 'Internal server error',
        code: (exception as any).code,
        cause: this.extractCause(exception),
        stack: this.stackLines(exception),
      };
    }

    // Unknown / non-Error throw
    return {
      name: 'UnknownException',
      message: 'Internal server error',
    };
  }

  private stackLines(err: Error): string[] {
    if (!err.stack) return [];
    // keep first ~15 lines for readability
    return err.stack.split('\n').map(s => s.trim()).slice(0, 15);
  }

  private extractCause(err: any): string | undefined {
    // Node 16+ Error.cause or custom cause fields
    const cause = err?.cause;
    if (!cause) return undefined;
    if (typeof cause === 'string') return cause;
    if (cause instanceof Error) return cause.message || cause.name;
    if (typeof cause === 'object') return cause.message ?? cause.name;
    return String(cause);
  }

  private redactBody(body: any): any {
    if (!body || typeof body !== 'object') return body;

    const SENSITIVE_KEYS = [
      'password', 'pass', 'pwd',
      'token', 'accessToken', 'refreshToken', 'idToken',
      'authorization', 'auth',
      'secret', 'clientSecret',
      'creditCard', 'cardNumber', 'cvv',
      'pin',
    ];

    const redact = (v: any): any => {
      if (v === null || v === undefined) return v;
      if (Array.isArray(v)) return v.map(redact);
      if (typeof v !== 'object') return v;

      const out: Record<string, any> = {};
      for (const [k, val] of Object.entries(v)) {
        out[k] = SENSITIVE_KEYS.includes(k) ? '[REDACTED]' : redact(val);
      }
      return out;
    };

    try {
      return redact(body);
    } catch {
      return '[unserializable body]';
    }
  }
}

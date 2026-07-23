import {
    BadRequestException,
    CallHandler,
    ExecutionContext,
    Injectable,
    NestInterceptor,
} from '@nestjs/common';
import Busboy from 'busboy';

export type CloudFile = {
    fieldname: string;
    originalname: string;
    encoding?: string;
    mimetype: string;
    size: number;
    buffer: Buffer;
};

export type CloudMultipartResult = {
    files: Record<string, CloudFile[]>;
    fields: Record<string, string>;
};

type Mode = 'single' | 'array' | 'any';

export interface CloudMultipartOptions {
    fieldName?: string;
    mode?: Mode;
}

@Injectable()
export class CloudFunctionsMultipartInterceptor implements NestInterceptor {
    constructor(private readonly opts: CloudMultipartOptions = {}) {
    }

    async intercept(ctx: ExecutionContext, next: CallHandler) {
        const req: any = ctx.switchToHttp().getRequest();

        const ct = (req.headers?.['content-type'] as string) || '';
        if (!ct.startsWith('multipart/form-data')) {
            throw new BadRequestException('Content-Type must be multipart/form-data');
        }

        if (req.__cfMultipartParsed) return next.handle();

        const result = await this.parseWithBusboy(req);

        const mode: Mode = this.opts.mode ?? 'single';
        const field = this.opts.fieldName ?? 'file';

        req.body = result.fields;

        if (mode === 'single') {
            const arr = result.files[field] ?? [];
            req.file = arr[0];
            req.files = undefined;
        } else if (mode === 'array') {
            req.file = undefined;
            req.files = result.files[field] ?? [];
        } else {
            req.file = undefined;
            req.files = result.files; // map: fieldName -> CloudFile[]
        }

        req.__cfMultipartParsed = true;
        return next.handle();
    }

    private parseWithBusboy(req: any): Promise<CloudMultipartResult> {
        return new Promise((resolve, reject) => {
            const bb = Busboy({headers: req.headers as Record<string, string>});

            const files: Record<string, CloudFile[]> = {};
            const fields: Record<string, string> = {};

            bb.on('file', (fieldname, file, info) => {
                const {filename, mimeType, encoding} = info;
                const chunks: Buffer[] = [];
                let size = 0;
                file.on('data', (d: Buffer) => {
                    chunks.push(d);
                    size += d.length;
                });
                file.on('end', () => {
                    const buffer = Buffer.concat(chunks);
                    const item: CloudFile = {
                        fieldname,
                        originalname: filename,
                        mimetype: mimeType,
                        encoding,
                        size,
                        buffer,
                    };
                    if (!files[fieldname]) files[fieldname] = [];
                    files[fieldname].push(item);
                });
            });

            bb.on('field', (name, val) => {
                fields[name] = val;
            });

            bb.on('error', reject);
            bb.on('finish', () => resolve({files, fields}));

            if (req.rawBody && Buffer.isBuffer(req.rawBody)) {
                bb.end(req.rawBody);
            } else {
                req.pipe(bb);
            }
        });
    }
}

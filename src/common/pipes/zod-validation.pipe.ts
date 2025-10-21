import { PipeTransform, BadRequestException, ArgumentMetadata } from '@nestjs/common';
import { ZodSchema } from 'zod';

export class ZodValidationPipe implements PipeTransform {
    constructor(private readonly schema: ZodSchema) {
    }

    transform(value: unknown, _metadata: ArgumentMetadata) {
        const parsed = this.schema.safeParse(value);
        if (!parsed.success) {
            const issues = parsed.error.issues.map(i => ({
                path: i.path.join('.'),
                message: i.message,
            }));
            throw new BadRequestException({message: 'Validation failed', issues});
        }
        return parsed.data;
    }
}

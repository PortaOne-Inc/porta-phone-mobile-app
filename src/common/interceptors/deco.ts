import {
    applyDecorators,
    createParamDecorator,
    ExecutionContext,
    UseInterceptors,
} from '@nestjs/common';
import {
    CloudFunctionsMultipartInterceptor,
    CloudFile,
    CloudMultipartOptions,
} from './cloud-functions-multipart.interceptor';

export function CloudFileUpload(fieldName = 'file') {
    const opts: CloudMultipartOptions = {fieldName, mode: 'single'};
    return applyDecorators(
        UseInterceptors(new CloudFunctionsMultipartInterceptor(opts)),
    );
}

export function CloudFilesUpload(fieldName = 'files') {
    const opts: CloudMultipartOptions = {fieldName, mode: 'array'};
    return applyDecorators(
        UseInterceptors(new CloudFunctionsMultipartInterceptor(opts)),
    );
}

export function CloudAnyUpload() {
    const opts: CloudMultipartOptions = {mode: 'any'};
    return applyDecorators(
        UseInterceptors(new CloudFunctionsMultipartInterceptor(opts)),
    );
}

export const UploadedAnyFiles = createParamDecorator(
    (
        _data: unknown,
        ctx: ExecutionContext,
    ): Record<string, CloudFile[] | CloudFile> => {
        const req: any = ctx.switchToHttp().getRequest();
        return (req.files ?? {}) as Record<string, CloudFile[] | CloudFile>;
    },
);

export const UploadedCloudFile = createParamDecorator(
    (_data: unknown, ctx: ExecutionContext): CloudFile | undefined => {
        const req: any = ctx.switchToHttp().getRequest();
        return req.file as CloudFile | undefined;
    },
);

export const CloudFormFields = createParamDecorator(
    (_data: unknown, ctx: ExecutionContext): Record<string, string> => {
        const req: any = ctx.switchToHttp().getRequest();
        return (req.body ?? {}) as Record<string, string>;
    },
);

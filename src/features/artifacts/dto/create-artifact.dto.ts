// src/features/artifacts/dto/create-artifact.dto.ts
import {
    IsNotEmpty,
    IsOptional,
    IsString,
    IsArray,
    ArrayNotEmpty,
} from 'class-validator';

export class CreateArtifactDto {
    @IsString()
    @IsNotEmpty()
    applicationId!: string;

    @IsString()
    @IsNotEmpty()
    themeId!: string;

    @IsString()
    @IsNotEmpty()
    kind!: string;

    @IsString()
    @IsOptional()
    storagePath?: string;

    @IsString()
    @IsOptional()
    mimeType?: string;

    @IsOptional()
    size?: number;

    @IsOptional()
    checksum?: string;

    @IsArray()
    @IsOptional()
    sources?: Array<{ type: string; id: string }>;
}

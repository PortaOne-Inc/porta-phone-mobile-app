import { Collection } from 'fireorm';
import { Collections } from '../../../common';
import {
    IsString,
    IsOptional,
    IsInt,
    Min,
    IsArray,
    ValidateNested,
    IsISO8601, IsObject,
} from 'class-validator';
import { Type } from 'class-transformer';

class LinkRefDto {
    @IsString()
    type!: string;

    @IsString()
    id!: string;
}

@Collection(Collections.applicationAssetsRenditions)
export class Artifact {
    @IsString()
    id!: string;

    @IsString()
    ownerId!: string;

    @IsString()
    applicationId!: string;

    @IsString()
    themeId!: string;

    @IsString()
    kind!: string;

    @IsOptional()
    @IsArray()
    @IsObject({each: true})
    sources?: Array<{ type: string; id: string }>;

    @IsString()
    storagePath!: string;

    @IsString()
    mimeType!: string;

    @IsInt()
    @Min(0)
    size!: number;

    @IsOptional()
    @IsString()
    checksum?: string | null;

    @IsISO8601()
    createdAt!: string;

    @IsISO8601()
    updatedAt!: string;

    @IsOptional()
    @IsInt()
    @Min(0)
    refCount?: number;

    @IsOptional()
    @IsArray()
    @IsObject({each: true})
    usedBy?: Array<{ type: string; id: string }>;
}


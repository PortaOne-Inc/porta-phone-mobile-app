import { Collection } from 'fireorm';
import { Collections } from '../../../../../common';
import {
    IsString,
    IsOptional,
    IsInt,
    Min,
    IsIn,
    ValidateNested,
    IsISO8601,
    Matches, ValidateIf,
} from 'class-validator';
import { Type } from 'class-transformer';

export const SPLASH_FIT_VALUES = [
    'fill',
    'contain',
    'cover',
    'fitWidth',
    'fitHeight',
    'none',
    'scaleDown',
] as const;
export type SplashFit = typeof SPLASH_FIT_VALUES[number];

export const SPLASH_MODE_VALUES = ['withBackground', 'withoutBackground'] as const;
export type SplashMode = typeof SPLASH_MODE_VALUES[number];

export class SplashParamsDto {
    @IsOptional()
    @ValidateIf((_, v) => v !== null && v !== undefined)
    @IsIn(SPLASH_FIT_VALUES as unknown as string[])
    fit?: SplashFit;

    @IsOptional()
    @IsInt()
    @Min(0)
    @ValidateIf((_, v) => v !== null && v !== undefined)
    paddingDp?: number;

    @IsOptional()
    @Matches(/^#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$/)
    @ValidateIf((_, v) => v !== null && v !== undefined)
    backgroundColorHex?: string;
}

export class SplashSourceDto {
    @IsOptional()
    @IsString()
    @ValidateIf((_, v) => v !== null && v !== undefined)
    foregroundAssetId?: string;

    @IsOptional()
    @IsString()
    @ValidateIf((_, v) => v !== null && v !== undefined)
    backgroundAssetId?: string;

    @IsOptional()
    @Matches(/^#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$/)
    @ValidateIf((_, v) => v !== null && v !== undefined)
    backgroundColorHex?: string;
}

export class SplashOutputArtifactsDto {
    @IsOptional()
    @IsString()
    @ValidateIf((_, v) => v !== null && v !== undefined)
    splashArtifactId?: string;

    @IsOptional()
    @IsString()
    @ValidateIf((_, v) => v !== null && v !== undefined)
    android12SplashArtifactId?: string;
}

/**
 * SplashAssetEntity
 *
 * Per-theme splash configuration + produced artifact id.
 * id === themeId.
 */
@Collection(Collections.themeAssetsSplash)
export class SplashAssetEntity {
    @IsString()
    id!: string;

    @IsString()
    applicationId!: string;

    @IsString()
    themeId!: string;

    @IsOptional()
    @ValidateNested()
    @Type(() => SplashSourceDto)
    source?: SplashSourceDto;

    @IsOptional()
    @ValidateNested()
    @Type(() => SplashParamsDto)
    params?: SplashParamsDto;

    @IsIn(SPLASH_MODE_VALUES as unknown as string[])
    mode!: SplashMode;

    @IsOptional()
    @ValidateNested()
    @Type(() => SplashOutputArtifactsDto)
    outputsArtifacts?: SplashOutputArtifactsDto;

    @IsISO8601()
    createdAt!: string;

    @IsISO8601()
    updatedAt!: string;
}

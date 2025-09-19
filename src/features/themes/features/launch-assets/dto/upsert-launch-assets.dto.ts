import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export type LaunchFit =
    | 'fill'
    | 'contain'
    | 'cover'
    | 'fitWidth'
    | 'fitHeight'
    | 'none'
    | 'scaleDown';

export class FitPaddingDto {
    @ApiPropertyOptional({
        enum: [
            'fill',
            'contain',
            'cover',
            'fitWidth',
            'fitHeight',
            'none',
            'scaleDown',
        ],
    })
    fit?: LaunchFit;

    @ApiPropertyOptional({description: 'Padding in dp'})
    paddingDp?: number;
}

export class PlatformParamsDto {
    @ApiPropertyOptional({type: FitPaddingDto}) androidLegacy?: FitPaddingDto;
    @ApiPropertyOptional({type: FitPaddingDto}) androidAdaptive?: FitPaddingDto;
    @ApiPropertyOptional({type: FitPaddingDto}) ios?: FitPaddingDto;
    @ApiPropertyOptional({type: FitPaddingDto}) web?: FitPaddingDto;
}

export class SourceConfigDto {
    @ApiPropertyOptional() foregroundAssetId?: string;
    @ApiPropertyOptional() backgroundAssetId?: string;

    @ApiPropertyOptional({description: 'Hex color #RRGGBB or #AARRGGBB'})
    backgroundColorHex?: string;
}

export class OutputArtifactsDto {
    @ApiPropertyOptional() androidLegacyArtifactId?: string;
    @ApiPropertyOptional() androidAdaptiveForegroundArtifactId?: string;
    @ApiPropertyOptional() androidAdaptiveBackgroundArtifactId?: string;
    @ApiPropertyOptional() iosArtifactId?: string;
    @ApiPropertyOptional() webArtifactId?: string;
}

export class LaunchAssetsEntityDto {
    @ApiProperty() id!: string;
    @ApiProperty() applicationId!: string;
    @ApiProperty() themeId!: string;

    @ApiPropertyOptional({type: SourceConfigDto}) source?: SourceConfigDto;
    @ApiPropertyOptional({type: PlatformParamsDto}) params?: PlatformParamsDto;

    @ApiPropertyOptional({type: OutputArtifactsDto})
    outputsArtifacts?: OutputArtifactsDto;

    @ApiProperty() createdAt!: string; // ISO
    @ApiProperty() updatedAt!: string; // ISO
}

// ---------- upsert payload ----------

/** Partial deep-merge upsert payload */
export class UpsertLaunchAssetsDto {
    @ApiPropertyOptional({type: SourceConfigDto}) source?: SourceConfigDto;
    @ApiPropertyOptional({type: PlatformParamsDto}) params?: PlatformParamsDto;
}

// ---------- optional validation in GET/GENERATE ----------

export class ValidationSliceDto {
    @ApiProperty() compliant!: boolean;
    @ApiProperty({
        description: 'signed: negative => inside, positive => overflow',
    })
    deltaDp!: number;
    @ApiPropertyOptional() message?: string;
}

export class ValidationReportDto {
    @ApiPropertyOptional({type: ValidationSliceDto})
    androidLegacy?: ValidationSliceDto;
    @ApiPropertyOptional({type: ValidationSliceDto})
    androidAdaptive?: ValidationSliceDto;
    @ApiPropertyOptional({type: ValidationSliceDto}) ios?: ValidationSliceDto;
    @ApiPropertyOptional({type: ValidationSliceDto}) web?: ValidationSliceDto;
}

export class PlatformConstraintsDto {
    @ApiProperty() sizeDp!: number;
    @ApiProperty() safeZoneDp!: number;
    @ApiProperty() toleranceDp!: number;
}

export class ConstraintsDefaultsDto {
    @ApiProperty({type: PlatformConstraintsDto})
    androidLegacy!: PlatformConstraintsDto;
    @ApiProperty({type: PlatformConstraintsDto})
    androidAdaptive!: PlatformConstraintsDto;
    @ApiProperty({type: PlatformConstraintsDto}) ios!: PlatformConstraintsDto;
    @ApiProperty({type: PlatformConstraintsDto}) web!: PlatformConstraintsDto;
}

// ---------- envelope for GET/GENERATE with expansions ----------

/** Response envelope when includeUrl/withValidation are requested */
export class LaunchAssetsWithUrlsDto {
    @ApiProperty({type: LaunchAssetsEntityDto})
    entity!: LaunchAssetsEntityDto;
    /** presigned urls resolved from outputsArtifacts (only if includeUrl=true) */
    @ApiPropertyOptional({
        type: 'object',
        properties: {
            androidLegacyUrl: {type: 'string'},
            androidAdaptiveForegroundUrl: {type: 'string'},
            androidAdaptiveBackgroundUrl: {type: 'string'},
            iosUrl: {type: 'string'},
            webUrl: {type: 'string'},
        },
    })
    urls?: {
        androidLegacyUrl?: string;
        androidAdaptiveForegroundUrl?: string;
        androidAdaptiveBackgroundUrl?: string;
        iosUrl?: string;
        webUrl?: string;
    };

    @ApiPropertyOptional({type: ValidationReportDto})
    validation?: ValidationReportDto;

    @ApiPropertyOptional({type: ConstraintsDefaultsDto})
    constraintsDefaults?: ConstraintsDefaultsDto;
}

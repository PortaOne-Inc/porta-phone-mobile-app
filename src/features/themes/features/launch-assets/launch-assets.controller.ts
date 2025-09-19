import {
    Controller,
    Delete,
    Get,
    Param,
    Put,
    Query,
    UseGuards,
    Req,
} from '@nestjs/common';
import { ApiBearerAuth, ApiQuery } from '@nestjs/swagger';
import { FirebaseAuthGuard } from '../../../auth/guard/firebase-auth.guard';
import { LaunchAssetsService, OutputTarget } from './launch-assets.service';
import { UpsertLaunchAssetsDto } from './dto/upsert-launch-assets.dto';
import {
    CloudAnyUpload,
    CloudFormFields,
    UploadedAnyFiles,
} from '../../../../common/interceptors/deco';
import { CloudFile } from '../../../../common/interceptors/cloud-functions-multipart.interceptor';
import { ConstraintsDefaultsDto } from './dto/defaults.dto';

@Controller('applications/:applicationId/themes/:themeId/launch-assets')
@ApiBearerAuth()
@UseGuards(FirebaseAuthGuard)
export class LaunchAssetsController {
    constructor(private readonly service: LaunchAssetsService) {
    }

    /** Get current config (with optional URLs + validation). */
    @Get()
    @ApiQuery({name: 'includeUrl', required: false, type: Boolean})
    @ApiQuery({name: 'urlTtlSec', required: false, type: Number})
    @ApiQuery({name: 'withValidation', required: false, type: Boolean})
    get(
        @Req() req: any,
        @Param('applicationId') appId: string,
        @Param('themeId') themeId: string,
        @Query('includeUrl') includeUrl?: string,
        @Query('urlTtlSec') urlTtlSec?: string,
        @Query('withValidation') withValidation?: string,
    ) {
        const uid: string = req.user.uid;
        return this.service.get(uid, appId, themeId, {
            includeUrl: includeUrl === 'true',
            urlTtlSec: urlTtlSec ? Number(urlTtlSec) : undefined,
            withValidation: withValidation === 'true',
        });
    }

    /** PUT (multipart): upsert + batch upload artifacts */
    @Put('upload-batch')
    @CloudAnyUpload()
    async upsertWithUploadBatch(
        @Req() req: any,
        @Param('applicationId') appId: string,
        @Param('themeId') themeId: string,
        @UploadedAnyFiles()
        files: Record<string, CloudFile[] | CloudFile | undefined>,
        @CloudFormFields() fields: Record<string, string>,
    ) {
        console.log('targets:', fields['targets']);
        console.log('files keys:', Object.keys(files ?? {}));

        const uid: string = req.user.uid;
        const targetsMap = fields['targets']
            ? (JSON.parse(fields['targets']) as Record<string, OutputTarget>)
            : {};
        const dtoRaw = fields['dto'];
        const dto: UpsertLaunchAssetsDto = dtoRaw ? JSON.parse(dtoRaw) : {};
        return this.service.upsertWithFiles(
            uid,
            appId,
            themeId,
            dto,
            files,
            targetsMap,
        );
    }

    /** Delete config (optionally cleaning up artifacts in service) */
    @Delete()
    remove(
        @Req() req: any,
        @Param('applicationId') appId: string,
        @Param('themeId') themeId: string,
    ) {
        const uid: string = req.user.uid;
        return this.service.remove(uid, appId, themeId);
    }

    /** Public endpoint: shared platform constraints defaults */
    @Get('constraints-defaults')
    async getConstraintsDefaults(): Promise<ConstraintsDefaultsDto> {
        return this.service.getConstraintsDefaults();
    }
}

import { IsIn, IsString } from 'class-validator';

export class LinkAssetDto {
  @IsIn(['user', 'embed', 'post', 'asset']) type!:
    | 'user'
    | 'embed'
    | 'post'
    | 'asset';
  @IsString() id!: string;
}

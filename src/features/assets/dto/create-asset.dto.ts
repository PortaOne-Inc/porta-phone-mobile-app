import { IsString, IsNumber, IsOptional } from 'class-validator';

export class CreateAssetDto {
  /** ID of the application the asset belongs to */
  @IsString() applicationId!: string;

  /** Full storage path of the file, e.g. "users/{uid}/assets/{assetId}.png" */
  @IsString()
  storagePath!: string;

  /** MIME type of the file, e.g. "image/png" */
  @IsString()
  mimeType!: string;

  /** File size in bytes */
  @IsNumber()
  size!: number;

  /** Optional checksum (e.g. sha256 hash) */
  @IsOptional()
  @IsString()
  checksum?: string;
}

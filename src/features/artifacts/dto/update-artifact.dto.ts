import { IsOptional, IsString, IsArray } from 'class-validator';

export class UpdateArtifactDto {
  @IsOptional()
  @IsString()
  checksum?: string;

  @IsOptional()
  @IsArray()
  usedBy?: Array<{ type: string; id: string }>;
}

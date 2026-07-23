import { Injectable, BadRequestException } from '@nestjs/common';
import * as admin from 'firebase-admin';
import * as path from 'node:path';
import { createHash } from 'crypto';
import { CloudStorageService } from '../../features/common/storage/cloud-storage.service';
import { Collections, UploadNamespace } from '../data/collections';

/**
 * Context describing the upload origin.
 */
export type UploadCtx = {
  /** User who owns the upload */
  uid: string;

  /** Application this upload belongs to */
  applicationId: string;

  /** Optional theme scope for the upload */
  themeId?: string;

  /** Target namespace (e.g. assets, artifacts) */
  namespace: UploadNamespace;

  /** Optional kind/type specifier for namespacing */
  kind?: string;
};

/**
 * Input describing the file to be uploaded.
 */
export type UploadInput = {
  /** File buffer + metadata provided by Multer */
  file: Express.Multer.File;

  /** Namespace used as ID prefix (e.g. 'assets', 'artifacts') */
  idPrefix: UploadNamespace;

  /** Fallback MIME type if Multer does not detect it */
  contentTypeFallback?: string;

  /** Optional custom metadata for the storage object */
  extraMetadata?: Record<string, any>;
};

/**
 * Result returned after a successful upload.
 */
export type BuiltUpload = {
  /** Generated unique document ID */
  id: string;

  /** Storage path where the file is saved */
  storagePath: string;

  /** Final MIME type applied to the object */
  mimeType: string;

  /** File size in bytes */
  size: number;

  /** SHA-256 checksum of the file buffer */
  checksum: string;

  /** File extension (e.g. ".png", ".zip") */
  ext: string;
};

/**
 * FileArtifactFactory
 *
 * Handles:
 * - Generating Firestore document IDs for supported namespaces.
 * - Computing file extensions and checksums.
 * - Uploading raw buffers to Google Cloud Storage via CloudStorageService.
 * - Returning a normalized "built" artifact description for persistence.
 */
@Injectable()
export class FileArtifactFactory {
  constructor(private readonly storage: CloudStorageService) {}

  /**
   * Generate a new Firestore document ID within the given namespace.
   */
  private newId(namespace: UploadNamespace) {
    return admin.firestore().collection(Collections[namespace]).doc().id;
  }

  /**
   * Extract file extension (lowercased, including the leading dot).
   * Returns "" if no extension is present.
   */
  private fileExt(originalName?: string) {
    return path.extname(originalName || '').toLowerCase(); // ".png" | ""
  }

  /**
   * Compute SHA-256 checksum of the file buffer.
   */
  private sha256(buffer: Buffer) {
    return createHash('sha256').update(buffer).digest('hex');
  }

  /**
   * Upload a file buffer to Google Cloud Storage, calculate checksum,
   * and return a structured `BuiltUpload` result.
   *
   * @throws BadRequestException if the buffer is empty
   */
  async upload(ctx: UploadCtx, inp: UploadInput): Promise<BuiltUpload> {
    const { file } = inp;
    if (!file?.buffer?.length) {
      throw new BadRequestException('Empty file buffer');
    }

    const id = this.newId(inp.idPrefix);
    const ext = this.fileExt(file.originalname);
    const mime =
      file.mimetype || inp.contentTypeFallback || 'application/octet-stream';

    const storagePath = this.storage.buildPath({
      uid: ctx.uid,
      applicationId: ctx.applicationId,
      themeId: ctx.themeId,
      namespace: ctx.namespace,
      kind: ctx.kind,
      id,
      ext,
    });

    await this.storage.saveBuffer(storagePath, file.buffer, {
      contentType: mime,
      metadata: inp.extraMetadata,
    });

    return {
      id,
      storagePath,
      mimeType: mime,
      size: file.size ?? file.buffer.length,
      checksum: this.sha256(file.buffer),
      ext,
    };
  }
}

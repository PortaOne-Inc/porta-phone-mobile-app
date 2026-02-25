import { Injectable } from '@nestjs/common';
import { Storage } from 'firebase-admin/storage';
import { UploadNamespace } from '../../../common';
import { GetSignedUrlConfig } from '@google-cloud/storage';

const STORAGE_PREFIX = (process.env.STORAGE_PREFIX ?? '').replace(/\/+$/, '');

export type BuildPathArgs = {
  uid: string;
  applicationId: string;
  themeId?: string;
  namespace: UploadNamespace;
  kind?: string;
  id: string;
  ext?: string;
};

export type SaveBufferOpts = {
  /** MIME type; default is 'application/octet-stream' */
  contentType?: string;
  /** Arbitrary metadata for the object */
  metadata?: Record<string, any>;
};

export type SignedUrlOpts = {
  /** TTL in seconds; default is 3600 */
  ttlSec?: number;
  /** Force a download filename */
  filename?: string;
  /**
   * Explicitly set Content-Type for the response (some viewers require it).
   * Maps to signed URL param "responseType".
   */
  responseContentType?: string;
};

@Injectable()
export class CloudStorageService {
  constructor(private readonly storage: Storage) {}

  /**
   * Builds a stable storagePath like:
   *   [STORAGE_PREFIX/]
   *   users/{uid}/applications/{appId}/{namespace}/{themeId?}/{kind?}/{id}{ext?}
   */
  buildPath(a: BuildPathArgs): string {
    const ext = normalizeExt(a.ext);
    const parts = [
      STORAGE_PREFIX, // may be empty
      'users',
      a.uid,
      'applications',
      a.applicationId,
      a.namespace,
      a.themeId,
      a.kind,
      `${a.id}${ext}`,
    ].filter(Boolean) as string[];

    return parts.join('/');
  }

  /**
   * Saves a buffer to GCS at the specified path.
   */
  async saveBuffer(
    storagePath: string,
    buffer: Buffer,
    opts: SaveBufferOpts = {},
  ): Promise<void> {
    const contentType = opts.contentType ?? 'application/octet-stream';
    const file = this.storage.bucket().file(storagePath);
    await file.save(buffer, {
      resumable: false,
      contentType,
      metadata: { contentType, ...(opts.metadata ?? {}) },
    });
  }

  /**
   * Server-side copy of a GCS object (no data flows through the backend).
   */
  async copyFile(srcPath: string, dstPath: string): Promise<void> {
    await this.storage.bucket().file(srcPath).copy(this.storage.bucket().file(dstPath));
  }

  /**
   * Deletes the file (ignoreNotFound=true).
   */
  async delete(storagePath: string): Promise<void> {
    await this.storage
      .bucket()
      .file(storagePath)
      .delete({ ignoreNotFound: true });
  }

  /**
   * Returns a short-lived signed URL for reading.
   */
  async getSignedUrl(
    storagePath: string,
    opts: SignedUrlOpts = {},
  ): Promise<string> {
    const { ttlSec = 3600, filename, responseContentType } = opts;

    const params: GetSignedUrlConfig = {
      action: 'read',
      expires: Date.now() + ttlSec * 1000,
    };

    if (filename) {
      params.responseDisposition = `attachment; filename="${filename}"`;
    }
    if (responseContentType) {
      params.responseType = responseContentType;
    }

    const [url] = await this.storage
      .bucket()
      .file(storagePath)
      .getSignedUrl(params);
    return url;
  }
}

/** Ensure extension starts with a single dot (".png"), or empty string. */
function normalizeExt(ext?: string): string {
  if (!ext) return '';
  const e = ext.trim();
  if (!e) return '';
  return e.startsWith('.') ? e : `.${e}`;
}

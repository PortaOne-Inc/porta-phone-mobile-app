import 'package:domain/domain.dart';

/// Repository that manages application assets and their storage records.
abstract class AssetRepository {
  // ----------------------------
  // Create / Read / Update / Delete
  // ----------------------------

  /// Uploads a file to Storage and creates an Asset record.
  ///
  /// Returns the created [AssetModel].
  Future<AssetModel> createAssetFromFile({
    required String applicationId,
    required String filename,
    required List<int> bytes,
    required String mimeType,
  });

  /// Returns all assets for the given application.
  ///
  /// If [includeUrl] is true, the backend should include a short-lived signed URL.
  /// Optionally, set [urlTtlSec] as the time-to-live (in seconds) for that URL.
  Future<List<AssetModel>> getApplicationAssets(
    String applicationId, {
    bool includeUrl = false,
    int? urlTtlSec,
  });

  /// Returns a single asset by its [assetId].
  ///
  /// If [includeUrl] is true, the backend should include a short-lived signed URL.
  /// Optionally, set [urlTtlSec] as the time-to-live (in seconds) for that URL.
  Future<AssetModel> getAsset(
    String applicationId,
    String assetId, {
    bool includeUrl = false,
    int? urlTtlSec,
  });

  /// Updates asset metadata (e.g., checksum) and returns the updated [AssetModel].
  Future<AssetModel> updateAsset(
    String applicationId,
    String assetId, {
    String? checksum,
  });

  /// Deletes an asset and its underlying file in Storage.
  Future<void> deleteAsset(String applicationId, String assetId);

  /// Links an asset to another entity (increments `refCount`) and returns the updated [AssetModel].
  Future<AssetModel> linkAsset(
    String applicationId,
    String assetId,
    AssetLink link,
  );

  /// Unlinks an asset from another entity (decrements `refCount`) and returns the updated [AssetModel].
  Future<AssetModel> unlinkAsset(
    String applicationId,
    String assetId,
    AssetLink link,
  );

  /// Returns a short-lived signed download URL for the asset.
  Future<String> getDownloadUrl(String applicationId, String assetId);

  // ----------------------------
  // Reactive streams (watch)
  // ----------------------------

  /// Emits the current list of assets for [applicationId] and all subsequent changes.
  ///
  /// Implementations should:
  /// - Push the latest cached value immediately (if available).
  /// - Emit new values whenever assets are created/updated/deleted.
  /// - Respect [includeUrl]/[urlTtlSec] if URLs are embedded into the emitted models.
  Stream<List<AssetModel>> watchApplicationAssets(
    String applicationId, {
    bool includeUrl = false,
    int? urlTtlSec,
  });

  /// Emits the current state of a single asset and all subsequent changes.
  ///
  /// Should complete with an error if the asset does not exist.
  /// If [includeUrl] is true, refresh/renew URLs as needed to keep them valid.
  Stream<AssetModel> watchAsset(
    String applicationId,
    String assetId, {
    bool includeUrl = false,
    int? urlTtlSec,
  });
}

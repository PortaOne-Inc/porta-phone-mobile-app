// import 'dart:async';
// import 'package:flutter/foundation.dart';
//
// import 'package:domain/domain.dart';
//
// class AssetsStore extends ChangeNotifier {
//   AssetsStore({
//     required GetApplicationAssetsUsecase getAssets,
//     required String applicationId,
//     this.defaultIncludeUrl = true,
//     this.defaultUrlTtlSec = 900,
//     this.autoLoad = true,
//   })  : _getAssets = getAssets,
//         _key = applicationId {
//     if (autoLoad) scheduleMicrotask(load);
//   }
//
//   final GetApplicationAssetsUsecase _getAssets;
//
//   String _key;
//   final bool defaultIncludeUrl;
//   final int defaultUrlTtlSec;
//   final bool autoLoad;
//
//   bool _loading = false;
//   Object? _error;
//   List<AssetModel> _assets = const [];
//
//   DateTime? _expiresAt;
//
//   bool get isLoading => _loading;
//
//   Object? get error => _error;
//
//   List<AssetModel> get assets => _assets;
//
//   String get applicationId => _key;
//
//   Future<void> setKey(String appId, {bool autoLoad = true}) async {
//     if (_key == appId) return;
//     _key = appId;
//     _error = null;
//     _expiresAt = null;
//     if (autoLoad) {
//       await load();
//     } else {
//       notifyListeners();
//     }
//   }
//
//   Future<void> load({bool? includeUrl, int? urlTtlSec}) async {
//     // якщо вже йде завантаження — просто ігноруємо
//     if (_loading) return;
//
//     final useUrl = includeUrl ?? defaultIncludeUrl;
//     final ttlSec = urlTtlSec ?? defaultUrlTtlSec;
//
//     _loading = true;
//     _error = null;
//     notifyListeners();
//
//     try {
//       final list = await _getAssets.execute(
//         applicationId: _key,
//         includeUrl: useUrl,
//         urlTtlSec: ttlSec,
//       );
//
//       _assets = list;
//       _expiresAt = useUrl ? DateTime.now().add(Duration(seconds: ttlSec)) : null;
//
//       _loading = false;
//       notifyListeners();
//     } catch (e) {
//       _loading = false;
//       _error = e;
//       notifyListeners();
//     }
//   }
//
//   Future<void> refreshIfExpired() async {
//     if (_expiresAt == null) return;
//     if (DateTime.now().isAfter(_expiresAt!)) {
//       await load();
//     }
//   }
//
//   Future<void> refresh() => load();
// }

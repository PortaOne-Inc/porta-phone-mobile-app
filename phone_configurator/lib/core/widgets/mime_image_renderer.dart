import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

String _nm(String s) => s.toLowerCase().trim();

bool _isSvg(String mime) => _nm(mime) == 'image/svg+xml';

bool _isImage(String mime) => _nm(mime).startsWith('image/');

abstract class MimeImageResource {
  const MimeImageResource(this.mimeType);

  factory MimeImageResource.fromUrl(String url, {required String mimeType}) =>
      _isSvg(mimeType)
      ? _SvgUrl(url, mimeType)
      : _isImage(mimeType)
      ? _RasterUrl(url, mimeType)
      : _OtherUrl(url, mimeType);

  factory MimeImageResource.fromBytes(
    Uint8List bytes, {
    required String mimeType,
  }) => _isSvg(mimeType)
      ? _SvgBytes(bytes, mimeType)
      : _isImage(mimeType)
      ? _RasterBytes(bytes, mimeType)
      : _OtherBytes(bytes, mimeType);

  factory MimeImageResource.fromFuture(
    Future<Uint8List?> future, {
    required String mimeType,
  }) => _isSvg(mimeType)
      ? _SvgFuture(future, mimeType)
      : _isImage(mimeType)
      ? _RasterFuture(future, mimeType)
      : _OtherFuture(future, mimeType);

  factory MimeImageResource.empty() => const _Empty();

  final String mimeType;

  bool get isSvg => _isSvg(mimeType);

  bool get isImage => _isImage(mimeType);

  T when<T>({
    required T Function() orElse,
    T Function(String url, String mimeType)? urlSvg,
    T Function(String url, String mimeType)? urlRaster,
    T Function(Uint8List bytes, String mimeType)? bytesSvg,
    T Function(Uint8List bytes, String mimeType)? bytesRaster,
    T Function(Future<Uint8List?> fut, String mimeType)? futureSvg,
    T Function(Future<Uint8List?> fut, String mimeType)? futureRaster,
    T Function(String mimeType)? other,
  });
}

class _SvgUrl extends MimeImageResource {
  const _SvgUrl(this.url, String mime) : super(mime);
  final String url;

  @override
  T when<T>({
    required T Function() orElse,
    T Function(String url, String mimeType)? urlSvg,
    T Function(String url, String mimeType)? urlRaster,
    T Function(Uint8List bytes, String mimeType)? bytesSvg,
    T Function(Uint8List bytes, String mimeType)? bytesRaster,
    T Function(Future<Uint8List?> fut, String mimeType)? futureSvg,
    T Function(Future<Uint8List?> fut, String mimeType)? futureRaster,
    T Function(String mimeType)? other,
  }) => urlSvg != null ? urlSvg(url, mimeType) : orElse();
}

class _RasterUrl extends MimeImageResource {
  const _RasterUrl(this.url, String mime) : super(mime);
  final String url;

  @override
  T when<T>({
    required T Function() orElse,
    T Function(String url, String mimeType)? urlSvg,
    T Function(String url, String mimeType)? urlRaster,
    T Function(Uint8List bytes, String mimeType)? bytesSvg,
    T Function(Uint8List bytes, String mimeType)? bytesRaster,
    T Function(Future<Uint8List?> fut, String mimeType)? futureSvg,
    T Function(Future<Uint8List?> fut, String mimeType)? futureRaster,
    T Function(String mimeType)? other,
  }) => urlRaster != null ? urlRaster(url, mimeType) : orElse();
}

class _SvgBytes extends MimeImageResource {
  const _SvgBytes(this.bytes, String mime) : super(mime);
  final Uint8List bytes;

  @override
  T when<T>({
    required T Function() orElse,
    T Function(String url, String mimeType)? urlSvg,
    T Function(String url, String mimeType)? urlRaster,
    T Function(Uint8List bytes, String mimeType)? bytesSvg,
    T Function(Uint8List bytes, String mimeType)? bytesRaster,
    T Function(Future<Uint8List?> fut, String mimeType)? futureSvg,
    T Function(Future<Uint8List?> fut, String mimeType)? futureRaster,
    T Function(String mimeType)? other,
  }) => bytesSvg != null ? bytesSvg(bytes, mimeType) : orElse();
}

class _RasterBytes extends MimeImageResource {
  const _RasterBytes(this.bytes, String mime) : super(mime);
  final Uint8List bytes;

  @override
  T when<T>({
    required T Function() orElse,
    T Function(String url, String mimeType)? urlSvg,
    T Function(String url, String mimeType)? urlRaster,
    T Function(Uint8List bytes, String mimeType)? bytesSvg,
    T Function(Uint8List bytes, String mimeType)? bytesRaster,
    T Function(Future<Uint8List?> fut, String mimeType)? futureSvg,
    T Function(Future<Uint8List?> fut, String mimeType)? futureRaster,
    T Function(String mimeType)? other,
  }) => bytesRaster != null ? bytesRaster(bytes, mimeType) : orElse();
}

class _SvgFuture extends MimeImageResource {
  const _SvgFuture(this.future, String mime) : super(mime);
  final Future<Uint8List?> future;

  @override
  T when<T>({
    required T Function() orElse,
    T Function(String url, String mimeType)? urlSvg,
    T Function(String url, String mimeType)? urlRaster,
    T Function(Uint8List bytes, String mimeType)? bytesSvg,
    T Function(Uint8List bytes, String mimeType)? bytesRaster,
    T Function(Future<Uint8List?> fut, String mimeType)? futureSvg,
    T Function(Future<Uint8List?> fut, String mimeType)? futureRaster,
    T Function(String mimeType)? other,
  }) => futureSvg != null ? futureSvg(future, mimeType) : orElse();
}

class _RasterFuture extends MimeImageResource {
  const _RasterFuture(this.future, String mime) : super(mime);
  final Future<Uint8List?> future;

  @override
  T when<T>({
    required T Function() orElse,
    T Function(String url, String mimeType)? urlSvg,
    T Function(String url, String mimeType)? urlRaster,
    T Function(Uint8List bytes, String mimeType)? bytesSvg,
    T Function(Uint8List bytes, String mimeType)? bytesRaster,
    T Function(Future<Uint8List?> fut, String mimeType)? futureSvg,
    T Function(Future<Uint8List?> fut, String mimeType)? futureRaster,
    T Function(String mimeType)? other,
  }) => futureRaster != null ? futureRaster(future, mimeType) : orElse();
}

class _OtherUrl extends MimeImageResource {
  const _OtherUrl(this.url, String mime) : super(mime);
  final String url;

  @override
  T when<T>({
    required T Function() orElse,
    T Function(String url, String mimeType)? urlSvg,
    T Function(String url, String mimeType)? urlRaster,
    T Function(Uint8List bytes, String mimeType)? bytesSvg,
    T Function(Uint8List bytes, String mimeType)? bytesRaster,
    T Function(Future<Uint8List?> fut, String mimeType)? futureSvg,
    T Function(Future<Uint8List?> fut, String mimeType)? futureRaster,
    T Function(String mimeType)? other,
  }) => other != null ? other(mimeType) : orElse();
}

class _OtherBytes extends MimeImageResource {
  const _OtherBytes(this.bytes, String mime) : super(mime);
  final Uint8List bytes;

  @override
  T when<T>({
    required T Function() orElse,
    T Function(String url, String mimeType)? urlSvg,
    T Function(String url, String mimeType)? urlRaster,
    T Function(Uint8List bytes, String mimeType)? bytesSvg,
    T Function(Uint8List bytes, String mimeType)? bytesRaster,
    T Function(Future<Uint8List?> fut, String mimeType)? futureSvg,
    T Function(Future<Uint8List?> fut, String mimeType)? futureRaster,
    T Function(String mimeType)? other,
  }) => other != null ? other(mimeType) : orElse();
}

class _OtherFuture extends MimeImageResource {
  const _OtherFuture(this.future, String mime) : super(mime);
  final Future<Uint8List?> future;

  @override
  T when<T>({
    required T Function() orElse,
    T Function(String url, String mimeType)? urlSvg,
    T Function(String url, String mimeType)? urlRaster,
    T Function(Uint8List bytes, String mimeType)? bytesSvg,
    T Function(Uint8List bytes, String mimeType)? bytesRaster,
    T Function(Future<Uint8List?> fut, String mimeType)? futureSvg,
    T Function(Future<Uint8List?> fut, String mimeType)? futureRaster,
    T Function(String mimeType)? other,
  }) => other != null ? other(mimeType) : orElse();
}

class _Empty extends MimeImageResource {
  const _Empty() : super('application/octet-stream');

  @override
  T when<T>({
    required T Function() orElse,
    T Function(String url, String mimeType)? urlSvg,
    T Function(String url, String mimeType)? urlRaster,
    T Function(Uint8List bytes, String mimeType)? bytesSvg,
    T Function(Uint8List bytes, String mimeType)? bytesRaster,
    T Function(Future<Uint8List?> fut, String mimeType)? futureSvg,
    T Function(Future<Uint8List?> fut, String mimeType)? futureRaster,
    T Function(String mimeType)? other,
  }) => orElse();
}

class MimeAwareImage extends StatelessWidget {
  const MimeAwareImage({
    required this.resource,
    super.key,
    this.fit = BoxFit.scaleDown,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.backgroundColor,
    this.placeholder,
    this.errorWidget,
  });

  final MimeImageResource resource;

  final BoxFit fit;
  final BorderRadius borderRadius;
  final Color? backgroundColor;
  final Widget? placeholder;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    final bg =
        backgroundColor ??
        Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.4);
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        color: bg,
        alignment: Alignment.center,
        child: _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    if (resource.isSvg) return _buildSvg();
    if (resource.isImage) return _buildRaster();
    return errorWidget ??
        const Icon(Icons.insert_drive_file_outlined, size: 40);
  }

  Widget _buildSvg() {
    return resource.when<Widget>(
      urlSvg: (url, _) =>
          SvgPicture.network(url, fit: fit, placeholderBuilder: _p),
      bytesSvg: (bytes, _) =>
          SvgPicture.memory(bytes, fit: fit, placeholderBuilder: _p),
      futureSvg: (fut, _) => _fromFuture(
        fut,
        (b) => SvgPicture.memory(b, fit: fit, placeholderBuilder: _p),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }

  Widget _buildRaster() {
    return resource.when<Widget>(
      urlRaster: (url, _) => Image.network(
        url,
        fit: fit,
        loadingBuilder: (ctx, child, evt) {
          if (evt == null) return child;
          final total = evt.expectedTotalBytes ?? 1;
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              value: evt.expectedTotalBytes != null
                  ? evt.cumulativeBytesLoaded / total
                  : null,
            ),
          );
        },
        errorBuilder: (_, __, ___) =>
            errorWidget ?? const Icon(Icons.broken_image_outlined, size: 40),
      ),
      bytesRaster: (bytes, _) => Image.memory(
        bytes,
        fit: fit,
        errorBuilder: (_, __, ___) =>
            errorWidget ?? const Icon(Icons.broken_image_outlined, size: 40),
      ),
      futureRaster: (fut, _) => _fromFuture(
        fut,
        (b) => Image.memory(
          b,
          fit: fit,
          errorBuilder: (_, __, ___) =>
              errorWidget ?? const Icon(Icons.broken_image_outlined, size: 40),
        ),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }

  Widget _p(BuildContext _) =>
      placeholder ??
      const Center(child: CircularProgressIndicator(strokeWidth: 2));

  Widget _fromFuture(
    Future<Uint8List?> fut,
    Widget Function(Uint8List) builder,
  ) {
    return FutureBuilder<Uint8List?>(
      future: fut,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) return _p(context);
        final data = snap.data;
        if (data == null) {
          return errorWidget ??
              const Icon(Icons.broken_image_outlined, size: 40);
        }
        return builder(data);
      },
    );
  }
}

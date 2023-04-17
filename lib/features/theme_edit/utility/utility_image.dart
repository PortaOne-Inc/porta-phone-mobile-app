// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import 'package:webtrit_configurator/share/entity/models/models.dart';
import 'package:webtrit_configurator/share/exception/exception.dart';

import '../model/models.dart';

class UtilityImage {
  static Future<ImageModel> pickImage(ImageFilterModel filter) async {
    final file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      requestFullMetadata: true,
    );

    final imageBytes = await file!.readAsBytes();

    final isImageInFormatRequirements = filter.format.format == file.mimeType;
    final isImageInSizeRangeAvailable = filter.size != null && filter.format != SupportFormat.svg;

    if (!isImageInFormatRequirements) {
      throw InvalidFormatImageException(file.mimeType ?? '');
    }

    if (isImageInSizeRangeAvailable) {
      final imageSize = await getImageSize(imageBytes);
      final isImageOutOfSizeRange = filter.size!.width < imageSize.width || filter.size!.height < imageSize.height;
      if (isImageOutOfSizeRange) {
        throw InvalidSizeImageException(
          maxWidth: filter.size?.width.toString() ?? '',
          maxHeight: filter.size?.width.toString() ?? '',
        );
      }
    }

    return ImageModel(
      data: base64Encode(imageBytes),
      name: file.name,
      mime: file.mimeType,
      extension: path.extension(file.name),
    );
  }

  static Future<Size> getImageSize(Uint8List bytes) async {
    final completer = Completer<Size>();
    final image = html.ImageElement(src: html.Url.createObjectUrlFromBlob(html.Blob([bytes])));
    image.onLoad.listen((_) {
      completer.complete(Size(image.width as double, image.height as double));
      html.Url.revokeObjectUrl(image.src!);
    });
    return completer.future;
  }
}

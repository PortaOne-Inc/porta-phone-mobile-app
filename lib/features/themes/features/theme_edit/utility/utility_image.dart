import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:image_size_getter/image_size_getter.dart';

import 'package:domain/domain.dart';

import '../models/models.dart';

class UtilityImage {
  static Future<ImageModel?> pickImage(ImageFilterModel filter) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [filter.format.format],
    );
    if (result == null) return null;

    final file = result.files.first;
    final name = file.name;
    final extension = file.extension;
    final bytes = file.bytes ?? Uint8List(0);

    if (extension == SupportFormat.png.format) {
      await _validateImageSize(bytes, filter);
    }

    return ImageModel(
      data: base64Encode(bytes),
      name: name,
      extension: extension,
    );
  }

  static Future<void> _validateImageSize(Uint8List bytes, ImageFilterModel filter) async {
    final imageSize = await getImageSize(bytes);
    if (filter.size!.width != imageSize.width || filter.size!.height != imageSize.height) {
      throw InvalidSizeImageException(
        maxWidth: filter.size?.width.toString() ?? '',
        maxHeight: filter.size?.width.toString() ?? '',
      );
    }
  }

  static Future<Size> getImageSize(Uint8List bytes) async {
    return ImageSizeGetter.getSize(MemoryInput(bytes));
  }
}

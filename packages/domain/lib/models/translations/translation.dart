import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation.freezed.dart';

@freezed
sealed class Translation with _$Translation {
  const factory Translation({
    required String locale,
    required String key,
    required String value,
  }) = _Translation;

  const Translation._();
}

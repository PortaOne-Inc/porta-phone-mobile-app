import 'dart:convert';
import 'dart:typed_data';

Uint8List? base64DecodeOrNull(String? source) => source == null ? null : base64.decode(source);

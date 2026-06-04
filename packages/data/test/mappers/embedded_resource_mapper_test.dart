import 'package:flutter_test/flutter_test.dart';

import 'package:domain/domain.dart';

import 'package:data/mappers/mappers.dart';

void main() {
  group('EmbeddedResourceMapper.convertTo', () {
    final mapper = EmbeddedResourceMapper();

    test('omits id from JSON when model id is null (create flow)', () {
      const model = EmbeddedResourceModel(
        uri: 'https://example.com',
        applicationId: 'app-1',
      );

      final json = mapper.convertTo(model).toJson();

      expect(json.containsKey('id'), isFalse);
    });

    test('keeps id in JSON when model id is set (update flow)', () {
      const model = EmbeddedResourceModel(
        id: 'embed-1',
        uri: 'https://example.com',
        applicationId: 'app-1',
      );

      final json = mapper.convertTo(model).toJson();

      expect(json['id'], 'embed-1');
    });
  });
}

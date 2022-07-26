import 'dart:convert';

import 'package:flutter_playground/extension/extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late EnumTest enu;
  setUp(() {
    enu = EnumTest();
  });
  group('enumテスト', () {
    test('enumの復習テスト', () {
      expect(enu.jsonAnimal, {});
      final animal = Animals(Name.cat, 12).toJson();
      expect(animal, {
        'name': '猫',
        'age': 12,
      });
    });
  });
}

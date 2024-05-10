import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_test/data/models/response_model.dart';

void main() {
  group('ResponseModel', () {
    
    test('fromJson creates a correct instance', () {
      // Mock JSON data
      final Map<String, dynamic> json = {
        'date': '2022-05-10T12:00:00Z',
        'explanation': 'A test explanation',
        'hdurl': 'https://example.com/image.jpg',
        'type': 'image',
        'version': '1.0',
        'title': 'Test title',
        'url': 'https://example.com/page'
      };

      // Create an instance from JSON
      final result = ResponseModel.fromJson(json);

      // Assert that the instance properties match expected values
      expect(result.date, DateTime.parse('2022-05-10T12:00:00Z'));
      expect(result.explanation, 'A test explanation');
      expect(result.hdurl, 'https://example.com/image.jpg');
      expect(result.type, 'image');
      expect(result.version, '1.0');
      expect(result.title, 'Test title');
      expect(result.url, 'https://example.com/page');
    });
  });
}

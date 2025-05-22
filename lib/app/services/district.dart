// district.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class DistrictService {
  final String baseUrl =
      'https://raw.githubusercontent.com/kongvut/thai-province-data/master/api_amphure.json';

  Future<List<Map<String, dynamic>>> fetchDistrictsByProvinceId(
    int provinceId,
  ) async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        // Filter districts by province_id
        final filtered =
            data.where((item) => item['province_id'] == provinceId).toList();
        return filtered
            .map<Map<String, dynamic>>(
              (item) => {
                'id': item['id'] as int,
                'name': item['name_th'] as String,
              },
            )
            .toList();
      } else {
        throw Exception('Failed to load districts');
      }
    } catch (e) {
      throw Exception('Error fetching districts: $e');
    }
  }
}

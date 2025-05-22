// province.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProvinceService {
  final String baseUrl =
      'https://raw.githubusercontent.com/kongvut/thai-province-data/master/api_province.json';

  Future<List<Map<String, dynamic>>> fetchProvinces() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        // Parse the JSON response and return a list of provinces with IDs
        final List<dynamic> data = jsonDecode(response.body);
        return data
            .map<Map<String, dynamic>>(
              (item) => {
                'id': item['id'] as int,
                'name': item['name_th'] as String,
              },
            )
            .toList();
      } else {
        throw Exception('Failed to load provinces');
      }
    } catch (e) {
      throw Exception('Error fetching provinces: $e');
    }
  }
}

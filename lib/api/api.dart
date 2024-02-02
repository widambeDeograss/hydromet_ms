import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiRequest {
  final String url = "http://192.168.130.169:5000";

  Future<dynamic> get(
    String urlData,
  ) async {
    var apiUrl = url + urlData;

    try {
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

import 'package:http/http.dart' as http;

class ApiRequest {
  final String url = "";

  get(
    String urlData,
  ) async {
    var apiUrl = url + urlData;

    try {
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

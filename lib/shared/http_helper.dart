import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  Future<http.Response?> getRequest(String url,
      {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return response;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<http.Response?> postRequest(String url, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      print(response);
      return response;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

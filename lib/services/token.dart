import 'dart:convert';

import 'package:aplicacion/services/globals.dart';
import 'package:http/http.dart' as http;

class TokenServices {
  static Future<http.Response> store_token(String token) async {
    Map data = {
      "token": token,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'token/store');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}

import 'dart:convert';

import 'package:estation/apiFunctions/networdk.dart';
import 'package:http/http.dart' as http;

class Auth {
  login(String email, String password) async {
    try {
      var response = await http
          .post(Uri.parse("https://estation-api.herokuapp.com/api/auth"),
              headers: {
                "Content-type": "application/json",
                "Accept": "application/json",
              },
              body: jsonEncode({"email": email, "password": password}))
          .timeout(const Duration(seconds: 10));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  refreshToken(String refreshToken) async {
    try {
      var response = await http
          .post(Uri.parse("https://estation-api.herokuapp.com/api/auth/refresh"),
              headers: Network.headers(hasToken: false),
              body: jsonEncode({
                "refreshToken": refreshToken
                }))
          .timeout(const Duration(seconds: 10));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}

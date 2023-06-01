import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
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
      return e.toString();
    }
  }

  refreshToken() async {
    try { 
      var response = await http
          .post(
              Uri.parse("https://estation-api.herokuapp.com/api/auth/refresh"),
              headers: {
                "Content-type": "application/json",
                "Accept": "application/json",
              },
              body: jsonEncode({
                "refreshToken": '${await SessionManager().get('refreshToken')}'
              }))
          .timeout(const Duration(seconds: 10)); 
      if (response.statusCode == 200) {
        SessionManager().set("token", jsonDecode(response.body)['token']);
        SessionManager()
            .set("refreshToken", jsonDecode(response.body)['refreshToken']);
      }
      return response;
    } catch (e) { 
      rethrow;
    }
  }
}

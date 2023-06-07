import 'dart:convert';

import 'package:estation/apiFunctions/networdk.dart';
import 'package:estation/components/appVars.dart';
import 'package:http/http.dart' as http;

class UserDao {
  static getUsers() async {
    try {
      var response = await http.get(
        Uri.parse("$apiUrl/user"),
        headers: await Network.headers(hasToken: true),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static getPomptes(id) async {
    try {
      var response = await http.get(
        Uri.parse("$apiUrl/user/getPompes/$id"),
        headers: await Network.headers(hasToken: true),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static addReleve(compteur, pompeUser) async {
    try {
      var response = await http.post(Uri.parse("$apiUrl/releve"),
          headers: await Network.headers(hasToken: true),
          body: jsonEncode({
            "compteur": compteur,
            "pompeUser": {"idPompeUser": pompeUser},
          }));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static getUserDetails(id) async {
    try {
      var response = await http.get(
        Uri.parse("$apiUrl/releve/getByUser/$id"),
        headers: await Network.headers(hasToken: true),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

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
}

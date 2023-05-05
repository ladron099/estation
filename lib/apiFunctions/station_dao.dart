
import 'package:estation/apiFunctions/networdk.dart';
import 'package:http/http.dart' as http;

import '../components/appVars.dart';
class StationDao{
   static getStations() async {
    try {
      var response = await http.get(
        Uri.parse("$apiUrl/station"),
        headers: await Network.headers(hasToken: true),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
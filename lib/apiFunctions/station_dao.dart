import 'package:estation/apiFunctions/networdk.dart';
import 'package:http/http.dart' as http;

import '../components/appVars.dart';

class StationDao {
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

  static getUsersStation(int id) async {
    try {
      var response = await http.get(
        Uri.parse("$apiUrl/user/getAllByStation/$id"),
        headers: await Network.headers(hasToken: true),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static stationInfo(int id) async {
    try {
      var response = await http.get(
        Uri.parse("$apiUrl/station/getInfo/$id"),
        headers: await Network.headers(hasToken: true),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

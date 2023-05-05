import 'package:flutter_session_manager/flutter_session_manager.dart';

class Network {
  static headers({hasToken = false}) async {
    
    return {
      "Content-type": "application/json",
      "Accept": "application/json",
      'Authorization':
          hasToken ? 'Bearer ${await SessionManager().get('token')}' : ''
    };
  }
}

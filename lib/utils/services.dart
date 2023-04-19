import 'package:estation/screens/pompiste/home_page.dart';
import 'package:estation/utils/models/User.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../screens/login_screen.dart';

Future<Widget> initWidget() async {
  bool? loggedIn = await SessionManager().get("loggedin");
  if (loggedIn != null && loggedIn) {
    return const HomePageScreen();
  } else
    return const LoginScreen();
}

Future<User>? getUserFromMemory() async {
  print(User.fromJson(await SessionManager().get("user")));
  return User.fromJson(await SessionManager().get("user"));
}

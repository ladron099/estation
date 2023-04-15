

import 'package:estation/screens/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../screens/login_screen.dart';

Future<Widget> initWidget() async {
  bool? loggedIn = await SessionManager().get("loggedin");
  if (loggedIn != null && loggedIn) {
    return const HomePageScreen();
  }else
  return const LoginScreen();
}
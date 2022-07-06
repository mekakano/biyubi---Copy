import 'dart:js';

import 'package:biyubi/screens/home_screen/homescreen.dart';
import 'package:biyubi/screens/login/login_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};

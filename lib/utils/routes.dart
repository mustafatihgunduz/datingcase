import 'package:datingcase/view/auth/login_screen.dart';
import 'package:datingcase/view/auth/register_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
};

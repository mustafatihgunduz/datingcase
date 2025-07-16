import 'package:datingcase/bottom_navigation_bar.dart';
import 'package:datingcase/view/auth/login/login_screen.dart';
import 'package:datingcase/view/auth/register/register_screen.dart';
import 'package:datingcase/view/auth/information/user_information_screen.dart';
import 'package:datingcase/view/home/home_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => HomeScreen(),
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/userInformation': (context) => UserInformationScreen(),
  '/nav': (context) => CustomBottomNavigationBar(),
};

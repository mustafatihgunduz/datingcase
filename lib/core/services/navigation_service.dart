import 'package:datingcase/core/services/firebase_analytics_service.dart';
import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._();
  static final NavigationService _instance = NavigationService._();
  factory NavigationService() => _instance;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final FirebaseAnalyticsService _analyticsService = FirebaseAnalyticsService();

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    _analyticsService.logNavigation(screenName: routeName);
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }

  Future<dynamic> pushReplacement(String routeName, {Object? arguments}) {
    _analyticsService.logNavigation(screenName: routeName);
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }
}

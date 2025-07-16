import 'package:datingcase/core/services/logger_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  static final FirebaseAnalyticsService _instance =
      FirebaseAnalyticsService._internal();
  factory FirebaseAnalyticsService() => _instance;
  FirebaseAnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  Future<void> logAppOpen() async {
    CaseLogger.info('Logging app open event');
    await _analytics.logAppOpen();
  }

  Future<void> logAddToFavorites({
    required String movieId,
    required String movieTitle,
  }) async {
    CaseLogger.info('Logging add to favorites for movie: $movieTitle');
    await _analytics.logEvent(
      name: 'add_to_favorites',
      parameters: {'movie_id': movieId, 'movie_title': movieTitle},
    );
  }

  Future<void> logNavigation({
    required String screenName,
    Map<String, Object>? parameters,
  }) async {
    CaseLogger.info('Logging navigation to screen: $screenName');
    await _analytics.logEvent(
      name: 'navigation',
      parameters: {'screen_name': screenName, ...?parameters},
    );
  }
}

  import 'dart:developer';

import 'package:dobe/firebase/appevents.dart';
import 'package:dobe/model/user.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
enum LoginType { USER_ROLE1, USER_ROLE2, unverified }

  

class Analytics {
    static final Analytics events = Analytics._internal();

  factory Analytics() {
    return events;
  }

  Analytics._internal();

  static FirebaseAnalytics? analytics;
  static FirebaseAnalyticsObserver? observer;

  static void initFirebaseAnalaytics() async {
    analytics = FirebaseAnalytics.instance;
    observer = FirebaseAnalyticsObserver(analytics: analytics!);
  }

  static void identifyUser(User user) {
    analytics!.setUserId(id: user.emailId);

    String userRole;
    switch (user.userRole) {
      case UserRole.yirauser:
        userRole = 'normal';
        break;
      case UserRole.admin:
        userRole = 'admin';
        break;
      default:
        userRole = '';
    }

    if (userRole != null) {
      analytics!.setUserProperty(
        name: 'user_role',
        value: userRole,
      );
    }
  }

  static void logAppOpen() {
    analytics!.logAppOpen();
  }

  static void logLogin() {
    analytics!.logLogin();
  }

  static void logEvent(AppEvents event,Map<String,dynamic> parameters) {
    Map<String,dynamic> appeventData=event.eventDetails;
    log('the loged event was ${appeventData['eventName']} ${parameters.toString()}');
    analytics!.logEvent(name: appeventData['eventName'].toString(),parameters: parameters);
  }

  static void setCurrentScreen(String screenName) {
    analytics!.logScreenView(
      screenName: screenName,
      screenClass: ''
    );
  }
}

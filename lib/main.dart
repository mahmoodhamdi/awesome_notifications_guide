import 'dart:async';

import 'package:awesome_notifications_guide/app.dart';
import 'package:awesome_notifications_guide/awesome_notifications_helper.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Always initialize Awesome Notifications
  await AwesomeNotificationsHelper.initializeLocalNotifications();
  await AwesomeNotificationsHelper.initializeIsolateReceivePort();
  runApp(const MyApp());
}

// ignore_for_file: avoid_classes_with_only_static_members, omit_local_variable_types

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzlatest;

class NotificationApi {
  static FlutterLocalNotificationsPlugin? _notifications;

  static Future<FlutterLocalNotificationsPlugin> get notifications async {
    if (_notifications != null) return _notifications!;

    _notifications = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await _notifications!.initialize(
      initializationSettings,
    );

    return _notifications!;
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    FlutterLocalNotificationsPlugin notification = await notifications;
    notification.show(id, title, body, await _notificationDetails(),
        payload: 'teste');
  }

  static Future showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  }) async {
    FlutterLocalNotificationsPlugin notification = await notifications;
    tzlatest.initializeTimeZones();

    notification.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledDate, tz.local),
        await _notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        payload: payload);
  }

  static Future<NotificationDetails> _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }
}

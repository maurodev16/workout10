import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzL;

class CustomNotification {
  final int id;
  final String? title;
  final String? body;
  final String? payLoad; // send the user to an other page after clicked

  CustomNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payLoad,
  });
}

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidNotificationActionDetails;
  NotificationService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupNotificationPlugin();
  }
  _setupNotificationPlugin() async {
    await _setupTimezone();
    await _initializeNotifications();
  }

  Future<void> _setupTimezone() async {
    tzL.initializeTimeZones();
    final String? locationName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(locationName!));
  }

  Future<void> _initializeNotifications() async {
    // Verify platform
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    await localNotificationsPlugin.initialize(
      const InitializationSettings(
        android: android,
      ),
      onDidReceiveBackgroundNotificationResponse: (details) {},
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            // selectNotificationSubject.add(notificationResponse.payload);
            break;
          default:
        }
      },
    );
  }
}

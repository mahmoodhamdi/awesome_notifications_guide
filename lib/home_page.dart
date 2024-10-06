import 'package:awesome_notifications_guide/awesome_notifications_helper.dart';
import 'package:awesome_notifications_guide/schedule_notification_dialog.dart';
import 'package:flutter/material.dart';

///  *********************************************
///     HOME PAGE
///  *********************************************
///
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Push the buttons below to create new notifications',
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            FloatingActionButton(
              heroTag: '1',
              onPressed: () =>
                  AwesomeNotificationsHelper.createNewNotification(),
              tooltip: 'Create Basic notification',
              child: const Icon(Icons.outgoing_mail),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: '5',
              onPressed: () =>
                  AwesomeNotificationsHelper.scheduleMinuteNotifications(
                title: "title",
                message: "message",
                username: "username",
              ),
              tooltip: 'Execute long task',
              child: const Icon(Icons.timer),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (context) => const ScheduleNotificationDialog(),
                );

                if (result != null) {
                  await AwesomeNotificationsHelper.scheduleNewNotification(
                    scheduledDateTime: result['scheduledDateTime'],
                    title: "title",
                    message: "result['message']",
                    username: "result['username']",
                    repeatNotification: result['repeatNotification'],
                  );
                }
              },
              tooltip: 'Schedule New notification',
              child: const Icon(Icons.access_time_outlined),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: '3',
              onPressed: () => AwesomeNotificationsHelper.resetBadgeCounter(),
              tooltip: 'Reset badge counter',
              child: const Icon(Icons.exposure_zero),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: '4',
              onPressed: () => AwesomeNotificationsHelper.cancelNotifications(),
              tooltip: 'Cancel all notifications',
              child: const Icon(Icons.delete_forever),
            ),
          ],
        ),
      ),
    );
  }
}

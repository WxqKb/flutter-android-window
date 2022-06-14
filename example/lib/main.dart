import 'package:android_window/main.dart' as android_window;
// import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
// import 'package:system_alert_window/system_alert_window.dart';

import 'android_window.dart';

@pragma('vm:entry-point')
void androidWindow() {
  runApp(const VotingMachine());
}

// show() {
//   SystemWindowHeader header = SystemWindowHeader(
//       title: SystemWindowText(
//           text: "全局悬浮框", fontSize: 10, textColor: Colors.black45),
//       padding: SystemWindowPadding.setSymmetricPadding(12, 12),
//       decoration: SystemWindowDecoration(startColor: Colors.grey[100]),
//       button: SystemWindowButton(
//           text: SystemWindowText(
//               text: "关闭", fontSize: 10, textColor: Colors.black45),
//           tag: "close_btn"),
//       buttonPosition: ButtonPosition.TRAILING);
//   // SystemWindowFooter footer = SystemWindowFooter(
//   //     buttons: [
//   //       SystemWindowButton(
//   //         text: SystemWindowText(
//   //             text: "Simple button",
//   //             fontSize: 12,
//   //             textColor: Color.fromRGBO(250, 139, 97, 1)),
//   //         tag: "simple_button", //useful to identify button click event
//   //         padding:
//   //             SystemWindowPadding(left: 10, right: 10, bottom: 10, top: 10),
//   //         width: 0,
//   //         height: SystemWindowButton.WRAP_CONTENT,
//   //         decoration: SystemWindowDecoration(
//   //             startColor: Colors.white,
//   //             endColor: Colors.white,
//   //             borderWidth: 0,
//   //             borderRadius: 0.0),
//   //       ),
//   //       SystemWindowButton(
//   //         text: SystemWindowText(
//   //             text: "Focus button", fontSize: 12, textColor: Colors.white),
//   //         tag: "focus_button",
//   //         width: 0,
//   //         padding:
//   //             SystemWindowPadding(left: 10, right: 10, bottom: 10, top: 10),
//   //         height: SystemWindowButton.WRAP_CONTENT,
//   //         decoration: SystemWindowDecoration(
//   //           startColor: Color.fromRGBO(250, 139, 97, 1),
//   //           endColor: Color.fromRGBO(247, 28, 88, 1),
//   //           borderWidth: 0,
//   //           borderRadius: 30.0,
//   //         ),
//   //       )
//   //     ],
//   //     padding: SystemWindowPadding(left: 16, right: 16, bottom: 12),
//   //     decoration: SystemWindowDecoration(startColor: Colors.white),
//   //     buttonsPosition: ButtonPosition.CENTER);
//
//   SystemWindowBody body = SystemWindowBody(
//     rows: [
//       EachRow(
//         columns: [
//           EachColumn(
//             text: SystemWindowText(
//                 text: "Some body", fontSize: 12, textColor: Colors.black45),
//           ),
//         ],
//         gravity: ContentGravity.CENTER,
//       ),
//     ],
//     padding: SystemWindowPadding(left: 16, right: 16, bottom: 12, top: 12),
//   );
//
//   SystemAlertWindow.showSystemWindow(
//       height: 150,
//       width: 300,
//       header: header,
//       body: body,
//       // footer: footer,
//       margin: SystemWindowMargin(left: 8, right: 8, top: 100, bottom: 0),
//       gravity: SystemWindowGravity.TOP,
//       notificationTitle: "Incoming Call",
//       notificationBody: "+1 646 980 4741",
//       prefMode: SystemWindowPrefMode.OVERLAY);
//   //Using SystemWindowPrefMode.DEFAULT uses Overlay window till Android 10 and bubble in Android 11
//   //Using SystemWindowPrefMode.OVERLAY forces overlay window instead of bubble in Android 11.
//   //Using SystemWindowPrefMode.BUBBLE forces Bubble instead of overlay window in Android 10 & above
// }

/// 应用后台服务任务
// void backgroundFetchHeadlessTask(HeadlessTask task) async {
//   var taskId = task.taskId;
//   var timeout = task.timeout;
//   if (timeout) {
//     print("[BackgroundFetch] Headless task timed-out: $taskId");
//     BackgroundFetch.finish(taskId);
//     return;
//   }
//
//   print("[BackgroundFetch] Headless event received: $taskId");
//
//   if (taskId == 'flutter_background_fetch') {
//     BackgroundFetch.scheduleTask(
//       TaskConfig(
//           taskId: "com.transistorsoft.customtask",
//           delay: 0,
//           periodic: false,
//           forceAlarmManager: true,
//           stopOnTerminate: false,
//           enableHeadless: true),
//     );
//   } else if (taskId == 'com.transistorsoft.customtask') {
//     // show();
//     android_window.open(
//       size: const Size(600, 800),
//       position: const Offset(100, 100),
//       focusable: true,
//       draggable: false,
//     );
//   }
//   BackgroundFetch.finish(taskId);
// }

// Future<void> initPlatformState() async {
//   // Configure BackgroundFetch.
//   try {
//     var status = await BackgroundFetch.configure(
//         BackgroundFetchConfig(
//             minimumFetchInterval: 15,
//             forceAlarmManager: false,
//             stopOnTerminate: false,
//             startOnBoot: true,
//             enableHeadless: true,
//             requiresBatteryNotLow: false,
//             requiresCharging: false,
//             requiresStorageNotLow: false,
//             requiresDeviceIdle: false,
//             requiredNetworkType: NetworkType.NONE),
//         _onBackgroundFetch,
//         _onBackgroundFetchTimeout);
//     print('[BackgroundFetch] configure success: $status');
//
//     // Schedule a "one-shot" custom-task in 10000ms.
//     // These are fairly reliable on Android (particularly with forceAlarmManager) but not iOS,
//     // where device must be powered (and delay will be throttled by the OS).
//     BackgroundFetch.scheduleTask(TaskConfig(
//         taskId: "com.transistorsoft.customtask",
//         delay: 10000,
//         periodic: false,
//         forceAlarmManager: true,
//         stopOnTerminate: false,
//         enableHeadless: true));
//   } on Exception catch (e) {
//     print("[BackgroundFetch] configure ERROR: $e");
//   }
// }

// void _onBackgroundFetch(String taskId) async {
//   android_window.open(
//     size: const Size(600, 800),
//     position: const Offset(100, 100),
//     focusable: true,
//     draggable: false,
//   );
//   BackgroundFetch.finish(taskId);
// }

/// This event fires shortly before your task is about to timeout.  You must finish any outstanding work and call BackgroundFetch.finish(taskId).
// void _onBackgroundFetchTimeout(String taskId) {
//   print("[BackgroundFetch] TIMEOUT: $taskId");
//   BackgroundFetch.finish(taskId);
// }

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // android_window.open(
  //   size: const Size(600, 800),
  //   position: const Offset(100, 100),
  //   focusable: true,
  //   draggable: true,
  // );
  // runApp(const App());
  // BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
  // initPlatformState();
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter Demo', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    debugPrint('$height >>>>>> $width');
    android_window.setHandler((name, data) async {
      switch (name) {
        case 'hello':
          showSnackBar(context, 'message from android window: $data');
          return 'hello android window';
      }
      return null;
    });
    return Scaffold(
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(16), children: [
          ElevatedButton(
            onPressed: () async {
              showSnackBar(
                  context, '${await android_window.canDrawOverlays()}');
            },
            child: const Text('Check can draw overlays'),
          ),
          const ElevatedButton(
            onPressed: android_window.requestPermission,
            child: Text('Request overlay display permission'),
          ),
          ElevatedButton(
            onPressed: () => android_window.open(
              size: const Size(600, 800),
              position: Offset(width - 600 - 16, height - 600 - 16),
              focusable: true,
              draggable: false,
            ),
            child: const Text('Open android window'),
          ),
          const ElevatedButton(
            onPressed: android_window.close,
            child: Text('Close android window'),
          ),
          ElevatedButton(
            onPressed: () => android_window.resize(600, 400),
            child: const Text('resize(600, 400)'),
          ),
          ElevatedButton(
            onPressed: () => android_window.resize(400, 600),
            child: const Text('resize(400, 600)'),
          ),
          ElevatedButton(
            onPressed: () => android_window.setPosition(0, 0),
            child: const Text('setPosition(0, 0)'),
          ),
          ElevatedButton(
            onPressed: () => android_window.setPosition(300, 300),
            child: const Text('setPosition(300, 300)'),
          ),
          ElevatedButton(
            onPressed: () async {
              final response = await android_window.post(
                'hello',
                'hello android window',
              );
              showSnackBar(context, 'response from android window: $response');
            },
            child: const Text('Send message to android window'),
          ),
        ]),
      ),
    );
  }

  showSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
  }
}

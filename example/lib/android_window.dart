import 'dart:io';

import 'package:android_window/android_window.dart';
import 'package:flutter/material.dart';

// class AndroidWindowApp extends StatelessWidget {
//   const AndroidWindowApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Flutter Demo',
//       home: HomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     AndroidWindow.setHandler((name, data) async {
//       switch (name) {
//         case 'hello':
//           showSnackBar(context, 'message from main app: $data');
//           return 'hello main app';
//       }
//       return null;
//     });
//     return AndroidWindow(
//       child: ClipRRect(
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         borderRadius: const BorderRadius.all(Radius.circular(8)),
//         child: Scaffold(
//           backgroundColor: Colors.white.withOpacity(1),
//           body: Padding(
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const TextField(),
//                 ElevatedButton(
//                   onPressed: () {
//                     AndroidWindow.close();
//                     exit(0);
//                   },
//                   child: const Text('Close'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     final response = await AndroidWindow.post(
//                       'hello',
//                       'hello main app',
//                     );
//                     showSnackBar(
//                       context,
//                       'response from main app: $response',
//                     );
//                   },
//                   child: const Text('Send message'),
//                 ),
//                 const ElevatedButton(
//                   onPressed: AndroidWindow.launchApp,
//                   child: Text('Launch app'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   showSnackBar(BuildContext context, String title) {
//     final snackBar =
//         SnackBar(content: Text(title), padding: const EdgeInsets.all(8));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }

class VotingMachine extends StatelessWidget {
  const VotingMachine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voting Machine',
      home: AndroidWindow(
        child: Material(
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '投票器',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        AndroidWindow.close();
                        exit(0);
                      },
                      child:
                          const Icon(Icons.close, size: 20, color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    '投票',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

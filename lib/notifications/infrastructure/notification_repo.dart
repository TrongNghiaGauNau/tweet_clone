// import 'dart:convert';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dio/dio.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:hehe/notifications/presentation/views/notification_view.dart';
// import 'package:hehe/theme/pallete.dart';

// class NotificationRepository {
//   static const key =
//       'AAAA4V_Whow:APA91bGDyUqBMC2MhNiAUnAOSoApLrJpCgWKPfx4kDGb-ZT2vCAtGyBbgtSgph40Cm_lB-wVdEN45wZPb-WDNJqH5a3pbK45951YFlgualZNyyjdkZaf8W5VKFY2tFlHr_EnJcby60FU';

//   final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   final dio = Dio();

//   //-------------------------------------------------------------------------------------------------------------
//   Future startListenToFirebase() async {
//     await initializeLocalNotifications();
//     FirebaseMessaging.onMessage.listen(_firebaseMessagingForegroundHandler);
//     await addListener();
//   }

//   //Hàm lắng nghe sự kiện trên firebase sau đó gửi push noti khi app ở foreground
//   void _firebaseMessagingForegroundHandler(RemoteMessage message) async {
//     await createNotification(
//         title: message.notification?.title ?? 'Title',
//         body: message.notification?.body ?? 'Content');
//   }

//   Future<bool> addListener() async {
//     return AwesomeNotifications().setListeners(
//       onActionReceivedMethod: _onActionReceivedMethod,
//       onNotificationCreatedMethod: null,
//       onNotificationDisplayedMethod: null,
//       onDismissActionReceivedMethod: null,
//     );
//   }

//   //under functions is using awesome_notification
//   Future<void> initializeLocalNotifications() async {
//     await AwesomeNotifications().initialize(
//         null,
//         [
//           NotificationChannel(
//               importance: NotificationImportance.Max,
//               channelGroupKey: 'basic_channel_group',
//               channelKey: 'default_notification_channel_id',
//               channelName: 'Chat notifications',
//               channelDescription: 'Notification channel for chatting',
//               defaultColor: Pallete.blueColor,
//               channelShowBadge: true,
//               ledColor: Colors.white)
//         ],
//         channelGroups: [
//           NotificationChannelGroup(
//               channelGroupKey: 'basic_channel_group',
//               channelGroupName: 'Basic Notification Group')
//         ],
//         debug: kDebugMode);
//   }

//   Future<void> checkPermission() async {
//     bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
//     if (!isAllowed) {
//       await AwesomeNotifications().requestPermissionToSendNotifications();
//     }
//   }

//   // Hàm gọi Local notification khi nhấn nút Send notification trên ứng dụng
//   Future<void> createNotification(
//       {required String title, required String body}) async {
//     await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: DateTime.now().microsecond,
//         channelKey: 'default_notification_channel_id',
//         category: NotificationCategory.Message,
//         notificationLayout: NotificationLayout.Messaging,
//         // groupKey: '$chatChannelId',
//         title: title,
//         // badge: BadgeModel.fromNotification(this).total,
//         body: body,
//         wakeUpScreen: true,
//       ),
//     );
//   }

//   Future clearAllNotificationWhenLogout() async {
//     AwesomeNotifications().dismissAllNotifications();
//     // Eraser.clearAllAppNotifications();
//     // messaging.deleteToken();
//   }

//   //Hàm dùng để xử lý sự kiện khi click vào push noti khi app ở foreground
//   @pragma('vm:entry-point')
//   Future<void> _onActionReceivedMethod(ReceivedAction event) async {
//     //có thể cho navigate qua trang có sự kiện thông báo
//     //vd qua trang tin nhắn, tweet
//   }

//   //Hàm gửi push noti khi app ở background
//   @pragma('vm:entry-point')
//   Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//     await initializeLocalNotifications();
//     await createNotification(
//         title: message.notification?.title ?? 'Title from backgroumd',
//         body: message.notification?.body ?? 'Content from background');
//   }

//   //-------------------------------------------------------------------------------------------------------------
//   //under functions is using flutter_local_notification

//   void _innitLocalNotification() {
//     const androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const initializationSettings =
//         InitializationSettings(android: androidSettings);
//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (response) {
//         debugPrint(response.payload.toString());
//       },
//     );
//   }

//   Future<void> _showLocalNotification(RemoteMessage message) async {
//     final styleInformation = BigTextStyleInformation(
//         message.notification?.body.toString() ?? 'body message',
//         htmlFormatBigText: true,
//         contentTitle: message.notification?.title ?? 'title message',
//         htmlFormatContentTitle: true);
//     final androidDetails = AndroidNotificationDetails(
//         'com.example.hehe.urgent', 'mychannelid',
//         importance: Importance.max,
//         styleInformation: styleInformation,
//         priority: Priority.max);
//     final notificationDetails = NotificationDetails(android: androidDetails);
//     await flutterLocalNotificationsPlugin.show(
//         0,
//         message.notification?.title ?? 'title ',
//         message.notification?.body ?? 'body',
//         notificationDetails,
//         payload: message.data['body']);
//   }

//   //request user permision to show push notification
//   Future<void> requestPermission() async {
//     final messaging = FirebaseMessaging.instance;

//     final settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       debugPrint('User granted permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       debugPrint('User granted provisional permission');
//     }
//   }

//   //get device token to show push noti
//   Future<void> getToken() async {
//     final token = await FirebaseMessaging.instance.getToken();

//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser?.uid ?? '')
//         .set({'token': token}, SetOptions(merge: true));
//   }

//   //get receiver token for later to show push noti on their device
//   String receiverToken = '';
//   Future<void> getReceiverToken(String? receiverId) async {
//     final getToken = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(receiverId)
//         .get();

//     receiverToken = await getToken.data()?['token'];
//   }

//   //intialize this function to start get push notification from app
//   void firebaseNotification(context) {
//     _innitLocalNotification();

//     //background
//     FirebaseMessaging.onMessageOpenedApp.listen((message) async {
//       await Navigator.of(context).push(MaterialPageRoute(
//         builder: (_) => const NotificationView(),
//       ));
//     });

//     //foreground
//     FirebaseMessaging.onMessage.listen((message) async {
//       await _showLocalNotification(message);
//     });
//   }

//   //use this to send new data to FCM to show push noti on other device
//   Future<void> sendNotification(
//       {required String body, required String senderId}) async {
//     try {
//       await dio.post('https://fcm.googleapis.com/fcm/send',
//           data: jsonEncode(<String, dynamic>{
//             "to": receiverToken,
//             'priority': 'high',
//             'notification': <String, dynamic>{
//               'body': body,
//               'title': 'New Message !',
//             },
//             'data': <String, String>{
//               'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//               'status': 'done',
//               'senderId': senderId,
//             },
//           }),
//           options: Options(headers: <String, String>{
//             'Content-Type': 'application/json',
//             'Authorization': 'key=$key'
//           }));
//     } catch (e) {
//       debugPrint('notification_repo: $e');
//     }
//   }
// }

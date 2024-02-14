import 'package:Bliss/firebase_options.dart';
import 'package:Bliss/screens/navigation.dart';
import 'package:Bliss/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

late bool seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenonboard') ?? true;
  pref.setBool('seenonboard', false);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MainApp());
}

late BuildContext appContext;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Future<void> requestNotificationPermission() async {
    var status = await Permission.notification.status;

    if (status.isDenied || status.isPermanentlyDenied) {
      status = await Permission.notification.request();

      if (status.isDenied || status.isPermanentlyDenied) {}
    }

    var statuscamera = await Permission.camera.status;

    if (statuscamera.isDenied || statuscamera.isPermanentlyDenied) {
      statuscamera = await Permission.camera.request();

      if (statuscamera.isDenied || statuscamera.isPermanentlyDenied) {}
    }

    var statusubi = await Permission.location.status;

    if (statusubi.isDenied || statusubi.isPermanentlyDenied) {
      statusubi = await Permission.location.request();

      if (statusubi.isDenied || statusubi.isPermanentlyDenied) {}
    }
  }

  @override
  void initState() {
    super.initState();
    requestNotificationPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received foreground message: ${message.notification!.title}");
      appContext = context;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: seenOnboard ? const OnBoardingScreen() : const NavigationPage(),
    );
  }
}

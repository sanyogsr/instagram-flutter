import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/responnsive/mobile_screen_Layout.dart';
import 'package:instagram/responnsive/responsive_layout_screen.dart';
import 'package:instagram/responnsive/web_screen_layout.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/signup_screen.dart';
import 'package:instagram/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCAhgoHR8gVlo7IMPL4aK0cz64ag2cSea4",
            appId: "1:1094011654882:web:c1e06333de4c92ceedc4bb",
            messagingSenderId: "1094011654882",
            projectId: "instagram-app-1fa20",
            storageBucket: "instagram-app-1fa20.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Instagram",
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: LoginScreen());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_classification_app/pages/auth_page.dart';



class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return MaterialApp(
      title: 'MRI Recognizer',
      theme: ThemeData.light(),
      home: const AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

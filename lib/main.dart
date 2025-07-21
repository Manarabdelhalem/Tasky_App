import 'package:flutter/material.dart';
import 'package:tasky_app/screen/auth/login_screen.dart';

void main() {
  runApp(TaskyApp());
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: LoginScreen.route,
      // routes: {
      //   LoginScreen.route: (context) => LoginScreen(),
      // },
      home: LoginScreen(),
    );
  }
}

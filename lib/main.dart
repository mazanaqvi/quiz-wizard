import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:quiz_wizard/views/event_page.dart';
import 'package:quiz_wizard/views/login_page.dart';
import 'package:quiz_wizard/views/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: materialMainColor,
      ),
      home: const HomePage(),
    );
  }
}

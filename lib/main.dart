import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:quiz_wizard/views/event_page.dart';
import 'package:quiz_wizard/views/login_page.dart';
import 'package:quiz_wizard/views/styles.dart';

import 'controllers/avatar_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Get.put(AvatarController(), tag: 'avatarController');
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: materialMainColor,
      ),
      home: const LoginPage(),
    );
  }
}

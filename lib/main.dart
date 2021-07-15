import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_task/homePage.dart';
import 'package:schedule_task/mdiPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: MDIPage());
  }
}

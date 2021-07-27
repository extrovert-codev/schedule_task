import 'package:flutter/material.dart';
import 'package:schedule_task/mdiPage.dart';

void main() { 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MDIPage());
  }
}

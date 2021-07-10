import 'package:flutter/material.dart';
import 'package:schedule_task/createTicketPage.dart';
import 'package:schedule_task/dashboardPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: DashboardPage());
  }
}

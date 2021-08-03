import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:schedule_task/loginPage.dart';
import 'package:schedule_task/mdiPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget home = LoginPage();

  checkSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var empID = prefs.getString('employee_id');
    if (empID != null) {
      setState(() {
        home = MDIPage(
          empID: prefs.getString('employee_id'),
          name: prefs.getString('name'),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkSession();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: home,
        builder: EasyLoading.init());
  }
}

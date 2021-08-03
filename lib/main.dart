import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:schedule_task/loginPage.dart';
import 'package:schedule_task/mdiPage.dart';
import 'package:schedule_task/mobile/homePageMobile.dart';
import 'package:schedule_task/web/homePageWeb.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schedule_task/_GlobalScript.dart' as gScript;

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
      gScript.pageMobileSelected =
          HomePageMobile(empID: prefs.getString('employee_id'));
      gScript.pageWebSelected =
          HomePageWeb(empID: prefs.getString('employee_id'));

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

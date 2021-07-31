import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:schedule_task/mdiPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MDIPage(empID: 1906, name: 'Dika Desandra Ardiansyah'),
        builder: EasyLoading.init());
  }
}

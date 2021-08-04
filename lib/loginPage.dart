import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:schedule_task/_GlobalScript.dart' as gScript;
import 'package:schedule_task/_model/loginModel.dart';
import 'package:intl/intl.dart';
import 'package:schedule_task/mdiPage.dart';
import 'package:schedule_task/mobile/homePageMobile.dart';
import 'package:schedule_task/web/homePageWeb.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtNIK = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isRemember = false;
  String yr = '', mth = '', dy = '';
  int? pass;

  putSession(title, val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(title, val);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: Card(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.fromLTRB(50, 40, 50, 50),
              height: 550,
              width: 550,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/images/Trisco2.png')),
                  SizedBox(height: 10),
                  Text('Schedule Task',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 25)),
                  SizedBox(height: 10),
                  textBox(txtNIK, 'NIK', false, TextInputAction.next),
                  SizedBox(height: 10),
                  textBox(txtPassword, 'Password', true, TextInputAction.done),
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        login();
                      },
                      child: Button(
                          label: 'Login',
                          color: Color.fromRGBO(80, 110, 228, 1))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column textBox(controller, label, isPassword, action) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
            textInputAction: action,
            decoration: InputDecoration(
                hintText: label,
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder()),
            onSubmitted: (val) {
              if (label == 'Password') {
                login();
              }
            },
          ),
        ),
      ],
    );
  }

  login() {
    EasyLoading.show(status: 'Loading', maskType: EasyLoadingMaskType.black);
    LoginModel.getLogin(txtNIK.text).then((value) {
      if (value.listLoginData == null) {
        EasyLoading.dismiss();
        Alert(
            context: context,
            title: 'Opss!',
            desc: 'NIK atau password kamu tidak terdaftar :(',
            type: AlertType.error,
            buttons: [
              DialogButton(
                  color: Color.fromRGBO(80, 110, 228, 1),
                  child: Text('OK', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  })
            ]).show();
      } else {
        EasyLoading.dismiss();
        yr = DateFormat('yyyy')
            .format(DateTime.parse(value.listLoginData[0]['dob'].toString()));
        mth = DateFormat('MM')
            .format(DateTime.parse(value.listLoginData[0]['dob'].toString()));
        dy = DateFormat('dd')
            .format(DateTime.parse(value.listLoginData[0]['dob'].toString()));
        pass = int.parse(yr) + int.parse(mth) + int.parse(dy);
        if (txtPassword.text == pass.toString()) {
          putSession(
              'employee_id', value.listLoginData[0]['employee_id'].toString());
          putSession('name', value.listLoginData[0]['name'].toString());

          gScript.pageMobileSelected = HomePageMobile(
              empID: value.listLoginData[0]['employee_id'].toString());
          gScript.pageWebSelected = HomePageWeb(
              empID: value.listLoginData[0]['employee_id'].toString());

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MDIPage(
                      empID: value.listLoginData[0]['employee_id'].toString(),
                      name: value.listLoginData[0]['name'].toString())));
        } else {
          Alert(
              context: context,
              title: 'Opss!',
              desc: 'NIK atau password kamu tidak terdaftar :(',
              type: AlertType.error,
              buttons: [
                DialogButton(
                    color: Color.fromRGBO(80, 110, 228, 1),
                    child: Text('OK', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    })
              ]).show();
        }
      }
    });
  }
}

class Button extends StatelessWidget {
  const Button({Key? key, required this.label, required this.color})
      : super(key: key);

  final label, color;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
          height: 34,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Text(label,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 12)))),
    );
  }
}

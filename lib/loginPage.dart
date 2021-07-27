import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:schedule_task/mdiPage.dart';
import 'package:schedule_task/model/loginModel.dart';
import 'package:intl/intl.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: Card(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.fromLTRB(100, 40, 100, 50),
              height: 550,
              width: 550,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      child:
                          Image.asset('images/Trisco2.png', fit: BoxFit.fill)),
                  SizedBox(height: 5),
                  Text('Schedule Task',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 25)),
                  SizedBox(height: 20),
                  TextBox(controller: txtNIK, label: 'NIK'),
                  SizedBox(height: 10),
                  TextBox(
                      controller: txtPassword,
                      label: 'Password',
                      isPassword: true),
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        LoginModel.getLogin(txtNIK.text).then((value) {
                          if (value.listLoginData == null) {
                            Alert(
                                context: context,
                                title: 'Opss!',
                                desc: 'Wrong NIK or password!',
                                type: AlertType.error,
                                buttons: [
                                  DialogButton(
                                      color: Color.fromRGBO(80, 110, 228, 1),
                                      child: Text('OK',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.pop(context);
                                        });
                                      })
                                ]).show();
                          } else {
                            yr = DateFormat('yyyy').format(DateTime.parse(
                                value.listLoginData[0]['dob'].toString()));
                            mth = DateFormat('MM').format(DateTime.parse(
                                value.listLoginData[0]['dob'].toString()));
                            dy = DateFormat('dd').format(DateTime.parse(
                                value.listLoginData[0]['dob'].toString()));
                            pass =
                                int.parse(yr) + int.parse(mth) + int.parse(dy);
                            if (txtPassword.text == pass.toString()) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MDIPage(
                                          tsID: value.listLoginData[0]
                                                  ['employee_id']
                                              .toString())));
                            } else {
                              Alert(
                                  context: context,
                                  title: 'Opss!',
                                  desc: 'Wrong NIK or password!',
                                  type: AlertType.error,
                                  buttons: [
                                    DialogButton(
                                        color: Color.fromRGBO(80, 110, 228, 1),
                                        child: Text('OK',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          setState(() {
                                            Navigator.pop(context);
                                          });
                                        })
                                  ]).show();
                            }
                          }
                        });
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

class TextBox extends StatelessWidget {
  const TextBox(
      {Key? key,
      required this.controller,
      required this.label,
      this.isPassword})
      : super(key: key);

  final controller, label, isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(label,
        //     style: TextStyle(
        //         color: Color.fromRGBO(101, 109, 154, 1),
        //         fontFamily: 'Poppins',
        //         fontSize: 13)),
        // SizedBox(height: 5),
        SizedBox(
          height: 40,
          child: TextField(
              controller: controller,
              obscureText: (isPassword == true) ? true : false,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
              decoration: InputDecoration(
                  hintText: label,
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder())),
        ),
      ],
    );
  }
}

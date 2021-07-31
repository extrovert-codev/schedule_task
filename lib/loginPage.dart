import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:schedule_task/mobile/loginPageMobile.dart';
import 'package:schedule_task/web/loginPageWeb.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(watch: 0, tablet: 0, desktop: 930),
      mobile: LoginPageMobile(),
      desktop: LoginPageWeb(),
    );
  }
}

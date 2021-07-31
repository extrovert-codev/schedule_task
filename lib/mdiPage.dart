import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:schedule_task/mobile/mdiPageMobile.dart';
import 'package:schedule_task/web/mdiPageWeb.dart';

class MDIPage extends StatelessWidget {
  const MDIPage({Key? key, required this.empID, required this.name})
      : super(key: key);

  final empID, name;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(watch: 0, tablet: 0, desktop: 930),
      mobile: MDIPageMobile(empID: empID, name: name),
      desktop: MDIPageWeb(empID: empID, name: name),
    );
  }
}

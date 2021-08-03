import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:schedule_task/mobile/mdiPageMobile.dart';
import 'package:schedule_task/web/mdiPageWeb.dart';

class MDIPage extends StatefulWidget {
  const MDIPage({Key? key, required this.empID, required this.name})
      : super(key: key);

  final empID, name;

  @override
  _MDIPageState createState() => _MDIPageState();
}

class _MDIPageState extends State<MDIPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(watch: 300, tablet: 600, desktop: 950),
      watch: MDIPageMobile(empID: widget.empID, name: widget.name),
      mobile: MDIPageMobile(empID: widget.empID, name: widget.name),
      tablet: MDIPageWeb(empID: widget.empID, name: widget.name),
      desktop: MDIPageWeb(empID: widget.empID, name: widget.name),
    );
  }
}

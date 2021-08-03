import 'package:flutter/material.dart';
import 'package:schedule_task/loginPage.dart';
import 'package:schedule_task/web/addTicketsPageWeb.dart';
import 'package:schedule_task/web/allTicketsPageWeb.dart';
import 'package:schedule_task/web/homePageWeb.dart';
import 'package:schedule_task/web/myTicketsPageWeb.dart';
import 'package:schedule_task/_GlobalScript.dart' as gScript;
import 'package:shared_preferences/shared_preferences.dart';

class MDIPageWeb extends StatefulWidget {
  const MDIPageWeb({Key? key, required this.empID, required this.name})
      : super(key: key);

  final empID, name;

  @override
  _MDIPageWebState createState() => _MDIPageWebState();
}

class _MDIPageWebState extends State<MDIPageWeb> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color.fromRGBO(237, 240, 245, 1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sideBar(),
              Expanded(
                child: Column(
                  children: [
                    topBar(widget.name),
                    Expanded(child: SizedBox(child: gScript.pageWebSelected))
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Container sideBar() {
    return Container(
      width: 70,
      color: Color.fromRGBO(80, 110, 228, 1),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 15, bottom: 30),
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/images/Trisco.png',
                          fit: BoxFit.fill)),
                  menu('Home', Icons.home, HomePageWeb(empID: widget.empID)),
                  menu('My Ticket', Icons.list,
                      MyTicketsPageWeb(empID: widget.empID)),
                  menu('Add Ticket', Icons.add,
                      AddTicketsPageWeb(empID: widget.empID)),
                  menu('All Ticket', Icons.list_alt, AllTicketsPageWeb()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Tooltip menu(tooltip, ico, page) {
    return Tooltip(
      message: tooltip,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(5)),
      textStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w600),
      child: GestureDetector(
        onTap: () {
          setState(() {
            gScript.pageWebSelected = page;
          });
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            margin: EdgeInsets.only(top: 45),
            width: 25,
            height: 25,
            child: Icon(ico, color: Color.fromRGBO(190, 202, 230, 1)),
          ),
        ),
      ),
    );
  }

  Container topBar(init) {
    return Container(
      padding: EdgeInsets.only(right: 38),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // NotifBadge(
          //     ico: Icons.notifications_sharp, cnt: '10', color: Colors.red),
          Container(
              margin: EdgeInsets.only(left: 17, right: 12),
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                  child: Text(init.toString().substring(0, 1),
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600)))),
          Text(init.toString().substring(0, init.toString().indexOf(' ')),
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color.fromRGBO(112, 129, 185, 1))),
          PopupMenuButton(
            tooltip: 'Options',
            child: Center(
                child: Icon(Icons.keyboard_arrow_down,
                    color: Color.fromRGBO(112, 129, 185, 1), size: 15)),
            itemBuilder: (context) =>
                [PopupMenuItem(child: Text('Keluar'), value: 1)],
            onSelected: (val) async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}

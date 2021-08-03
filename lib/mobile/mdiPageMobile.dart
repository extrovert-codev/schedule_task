import 'package:flutter/material.dart';
import 'package:schedule_task/loginPage.dart';
import 'package:schedule_task/mobile/addTicketsPageMobile.dart';
import 'package:schedule_task/mobile/allTicketsPageMobile.dart';
import 'package:schedule_task/mobile/homePageMobile.dart';
import 'package:schedule_task/mobile/myTicketsPageMobile.dart';
import 'package:schedule_task/_GlobalScript.dart' as gScript;
import 'package:shared_preferences/shared_preferences.dart';

class MDIPageMobile extends StatefulWidget {
  const MDIPageMobile({Key? key, required this.empID, required this.name})
      : super(key: key);

  final empID, name;

  @override
  _MDIPageMobileState createState() => _MDIPageMobileState();
}

class _MDIPageMobileState extends State<MDIPageMobile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 2), () {
              setState(() {});
            });
          },
          child: ListView(children: [
            DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(80, 110, 228, 1)),
                child: Image.asset('assets/images/Trisco.png',
                    fit: BoxFit.scaleDown)),
            menu('Home', Icons.home, HomePageMobile(empID: widget.empID)),
            menu('My Ticket', Icons.list,
                MyTicketsPageMobile(empID: widget.empID)),
            menu('Add Ticket', Icons.add,
                AddTicketsPageMobile(empID: widget.empID)),
            menu('All Ticket', Icons.list_alt, AllTicketsPageMobile()),
          ]),
        ),
      ),
      body: SafeArea(
        child: Container(
            color: Color.fromRGBO(237, 240, 245, 1),
            child: Column(
              children: [
                topBar(widget.name),
                Expanded(child: SizedBox(child: gScript.pageMobileSelected))
              ],
            )),
      ),
    );
  }

  ListTile menu(title, ico, page) {
    return ListTile(
        title: Row(children: [
          Icon(ico, color: Color.fromRGBO(190, 202, 230, 1)),
          SizedBox(width: 10),
          Text(title,
              style: TextStyle(color: Colors.black, fontFamily: 'Poppins')),
        ]),
        onTap: () {
          setState(() {
            gScript.pageMobileSelected = page;
            Navigator.of(context).pop();
          });
        });
  }

  Container topBar(init) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Builder(
            builder: (context) {
              return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Icon(Icons.menu,
                      color: Color.fromRGBO(112, 129, 185, 1), size: 30));
            },
          ),
          Expanded(
            child: SizedBox(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // NotifBadge(
                //     ico: Icons.notifications_sharp,
                //     cnt: '10',
                //     color: Colors.red),
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
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.clear();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}

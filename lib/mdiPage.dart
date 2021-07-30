import 'package:flutter/material.dart';
import 'package:schedule_task/addTicketsPage.dart';
import 'package:schedule_task/allTicketsPage.dart';
import 'package:schedule_task/homePage.dart';
import 'package:schedule_task/myTicketsPage.dart';

class MDIPage extends StatefulWidget {
  const MDIPage({Key? key, required this.empID, required this.name})
      : super(key: key);

  final empID, name;

  @override
  _MDIPageState createState() => _MDIPageState();
}

class _MDIPageState extends State<MDIPage> {
  Widget? pageSelected;

  @override
  void initState() {
    super.initState();
    pageSelected = HomePage(empID: widget.empID);
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
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(20), child: pageSelected))
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
                  menu('Home', Icons.home, HomePage(empID: widget.empID)),
                  menu('My Ticket', Icons.list,
                      MyTicketsPage(empID: widget.empID)),
                  menu('Add Ticket', Icons.add,
                      AddTicketsPage(empID: widget.empID)),
                  menu('All Ticket', Icons.list_alt, AllTicketsPage()),
                ],
              ),
            ),
          ),
          // SizedBox(
          //   child: Column(
          //     children: [
          //       Container(
          //           margin: EdgeInsets.only(bottom: 25),
          //           width: 25,
          //           height: 25,
          //           child: Icon(Icons.chat_rounded,
          //               color: Color.fromRGBO(190, 202, 230, 1))),
          //       Container(
          //         margin: EdgeInsets.only(bottom: 20),
          //         width: 36,
          //         height: 36,
          //         decoration: BoxDecoration(
          //             color: Colors.amber,
          //             borderRadius: BorderRadius.circular(100)),
          //       ),
          //     ],
          //   ),
          // ),
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
            pageSelected = page;
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
          Icon(Icons.notifications_none,
              color: Color.fromRGBO(112, 129, 185, 1), size: 30),
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
          Icon(Icons.keyboard_arrow_down,
              color: Color.fromRGBO(112, 129, 185, 1), size: 15)
        ],
      ),
    );
  }
}

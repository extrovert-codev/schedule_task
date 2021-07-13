import 'package:flutter/material.dart';
import 'package:schedule_task/Widget/sideBar.dart';
import 'package:schedule_task/widget/dashboardPage/myStatus.dart';
import 'package:schedule_task/widget/gridViewKu.dart';
import 'package:schedule_task/widget/topBar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color.fromRGBO(237, 240, 245, 1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SideBar(),
              Expanded(
                child: Column(
                  children: [
                    TopBar(),
                    Expanded(
                        child: SizedBox(
                      child: ListView(
                        padding: EdgeInsets.all(20),
                        children: [
                          Container(
                              height: 80,
                              child: Row(children: [
                                MyStatus(
                                    color: Color.fromRGBO(41, 178, 237, 1),
                                    ico: Icons.tag,
                                    cnt: '2',
                                    title: 'TICKETS ON GOING'),
                                SizedBox(width: 50),
                                MyStatus(
                                    color: Color.fromRGBO(45, 223, 214, 1),
                                    ico: Icons.check,
                                    cnt: '467',
                                    title: 'TICKETS COMPLETE'),
                                SizedBox(width: 50),
                                MyStatus(
                                    color: Color.fromRGBO(255, 94, 219, 1),
                                    ico: Icons.hourglass_bottom,
                                    cnt: '128:07 min',
                                    title: 'HOURS WORKED')
                              ])),
                          SizedBox(height: 25),
                          Card(
                            elevation: 3,
                            child: Container(
                                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                                height: 600,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('My Tickets',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  48, 62, 103, 1),
                                              fontFamily: 'Poppins',
                                              fontSize: 16)),
                                      SizedBox(height: 18),
                                      Expanded(
                                          child: Container(
                                        child: GridViewKu(cntData: 2),
                                      ))
                                    ])),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

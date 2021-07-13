import 'package:flutter/material.dart';
import 'package:schedule_task/Widget/sideBar.dart';
import 'package:schedule_task/widget/gridViewKu.dart';
import 'package:schedule_task/widget/topBar.dart';

class MyTicketsPage extends StatefulWidget {
  const MyTicketsPage({Key? key}) : super(key: key);

  @override
  _MyTicketsPageState createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
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
                          Text('My Tickets',
                              style: TextStyle(
                                  color: Color.fromRGBO(112, 129, 185, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: 18)),
                          SizedBox(height: 15),
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
                                      Text('Ticket Lists',
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
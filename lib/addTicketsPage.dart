import 'package:flutter/material.dart';
import 'package:schedule_task/Widget/sideBar.dart';
import 'package:schedule_task/widget/addTickets.dart';
import 'package:schedule_task/widget/topBar.dart';

class AddTicketsPage extends StatefulWidget {
  const AddTicketsPage({Key? key}) : super(key: key);

  @override
  _AddTicketsPageState createState() => _AddTicketsPageState();
}

class _AddTicketsPageState extends State<AddTicketsPage> {
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
                          Text('Add Tickets',
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
                                      SizedBox(height: 18),
                                      Expanded(
                                          child: Container(
                                        child: AddTickets(),
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

import 'package:flutter/material.dart';
import 'package:schedule_task/_widget/gridViewKuMobile.dart';

class MyTicketsPageMobile extends StatefulWidget {
  const MyTicketsPageMobile({Key? key, required this.empID}) : super(key: key);

  final empID;

  @override
  _MyTicketsPageMobileState createState() => _MyTicketsPageMobileState();
}

class _MyTicketsPageMobileState extends State<MyTicketsPageMobile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ticket Lists',
                        style: TextStyle(
                            color: Color.fromRGBO(48, 62, 103, 1),
                            fontFamily: 'Poppins',
                            fontSize: 16)),
                    SizedBox(height: 18),
                    Expanded(
                        child: Container(
                      child: GridViewKuMobile(cntData: 2, empID: widget.empID),
                    ))
                  ])),
        ),
      ],
    );
  }
}

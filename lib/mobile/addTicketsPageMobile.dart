import 'package:flutter/material.dart';
import 'package:schedule_task/_widget/addTicketsMobile.dart';

class AddTicketsPageMobile extends StatefulWidget {
  const AddTicketsPageMobile({Key? key, required this.empID}) : super(key: key);

  final empID;

  @override
  _AddTicketsPageMobileState createState() => _AddTicketsPageMobileState();
}

class _AddTicketsPageMobileState extends State<AddTicketsPageMobile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
              padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
              height: 750,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 18),
                    Expanded(
                        child: Container(
                            child: AddTicketsMobile(empID: widget.empID)))
                  ])),
        ),
      ],
    );
  }
}

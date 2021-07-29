import 'package:flutter/material.dart';
import 'package:schedule_task/widget/addTickets.dart';

class AddTicketsPage extends StatefulWidget {
  const AddTicketsPage({Key? key, required this.empID}) : super(key: key);

  final empID;

  @override
  _AddTicketsPageState createState() => _AddTicketsPageState();
}

class _AddTicketsPageState extends State<AddTicketsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
              height: 430,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 18),
                    Expanded(
                        child: Container(
                      child: AddTickets(empID: widget.empID),
                    ))
                  ])),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:schedule_task/_widget/editTickets.dart';

class EditTicketsPage extends StatefulWidget {
  const EditTicketsPage(
      {Key? key,
      required this.ticketID,
      required this.picID,
      required this.subject,
      required this.valPriority,
      required this.tsID})
      : super(key: key);

  final ticketID, picID, subject, valPriority, tsID;

  @override
  _EditTicketsPageState createState() => _EditTicketsPageState();
}

class _EditTicketsPageState extends State<EditTicketsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Edit Tickets',
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
                      child: EditTickets(
                          ticketID: widget.ticketID,
                          picID: widget.picID,
                          subject: widget.subject,
                          valPriority: widget.valPriority,
                          tsID: widget.tsID),
                    ))
                  ])),
        ),
      ],
    );
  }
}

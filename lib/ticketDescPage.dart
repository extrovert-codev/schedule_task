import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:schedule_task/model/gridView/ticketModel.dart';
import 'package:schedule_task/widget/button.dart';

class TicketDescPage extends StatefulWidget {
  const TicketDescPage(
      {Key? key,
      required this.ticketID,
      required this.status,
      required this.subject})
      : super(key: key);

  final ticketID, status, subject;

  @override
  _TicketDescPageState createState() => _TicketDescPageState();
}

class _TicketDescPageState extends State<TicketDescPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(237, 240, 245, 1),
        child: ListView(
          children: [
            Container(
                height: 300,
                color: Colors.white,
                child: SingleChildScrollView(
                    padding: EdgeInsets.all(15), child: Text(widget.subject))),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Button(color: Colors.red, label: 'Back')),
                    SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Button(
                                color: Color.fromRGBO(80, 110, 228, 1),
                                label: 'Edit'),
                            SizedBox(width: 10)
                          ],
                        )),
                    Visibility(
                      visible: (widget.status == 'Waiting List') ? true : false,
                      child: GestureDetector(
                          onTap: () {
                            TicketModel.putTicket(widget.ticketID, '1', '')
                                .then((value) {
                              if (value == 'success') {
                                Alert(
                                    context: context,
                                    title: 'Noted!',
                                    desc: 'Ticket On Going!',
                                    type: AlertType.success,
                                    buttons: [
                                      DialogButton(
                                          color:
                                              Color.fromRGBO(80, 110, 228, 1),
                                          child: Text('OK',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            });
                                          })
                                    ]).show();
                              } else {
                                Alert(
                                    context: context,
                                    title: 'Failed!',
                                    desc: 'Ticket update failed!',
                                    type: AlertType.error,
                                    buttons: [
                                      DialogButton(
                                          color:
                                              Color.fromRGBO(80, 110, 228, 1),
                                          child: Text('OK',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context);
                                            });
                                          })
                                    ]).show();
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Button(color: Colors.orange, label: 'On Going'),
                              SizedBox(width: 10)
                            ],
                          )),
                    ),
                    Visibility(
                      visible: (widget.status == 'Waiting List' ||
                              widget.status == 'On Going')
                          ? true
                          : false,
                      child: GestureDetector(
                          onTap: () {
                            TicketModel.putTicket(
                                    widget.ticketID, '2', 'Done gais')
                                .then((value) {
                              if (value == 'success') {
                                Alert(
                                    context: context,
                                    title: 'Noted!',
                                    desc: 'Ticket Finished!',
                                    type: AlertType.success,
                                    buttons: [
                                      DialogButton(
                                          color:
                                              Color.fromRGBO(80, 110, 228, 1),
                                          child: Text('OK',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            });
                                          })
                                    ]).show();
                              } else {
                                Alert(
                                    context: context,
                                    title: 'Failed!',
                                    desc: 'Ticket update failed!',
                                    type: AlertType.error,
                                    buttons: [
                                      DialogButton(
                                          color:
                                              Color.fromRGBO(80, 110, 228, 1),
                                          child: Text('OK',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context);
                                            });
                                          })
                                    ]).show();
                              }
                            });
                          },
                          child: Button(color: Colors.green, label: 'Finish')),
                    ),
                    Visibility(
                      visible: (widget.status == 'Finish') ? true : false,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Button(color: Colors.blue, label: 'Feedback')
                            ],
                          )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

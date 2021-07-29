import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:schedule_task/model/gridView/ticketModel.dart';
import 'package:schedule_task/widget/button.dart';
import 'package:schedule_task/widget/editTickets.dart';

class TicketDescPage extends StatefulWidget {
  const TicketDescPage(
      {Key? key,
      required this.ticketID,
      required this.picID,
      required this.subject,
      required this.priority,
      required this.status,
      required this.tsID})
      : super(key: key);

  final ticketID, picID, subject, priority, status, tsID;

  @override
  _TicketDescPageState createState() => _TicketDescPageState();
}

class _TicketDescPageState extends State<TicketDescPage> {
  TextEditingController txtFeedback = TextEditingController();

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
                    btBack(context),
                    SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Form(
                                      child: Container(
                                    child: EditTickets(
                                        ticketID: widget.ticketID,
                                        picID: widget.picID,
                                        subject: widget.subject,
                                        sPriority: widget.priority,
                                        tsID: widget.tsID),
                                  )),
                                );
                              });
                        },
                        child: Row(
                          children: [
                            Button(
                                color: Color.fromRGBO(80, 110, 228, 1),
                                label: 'Edit'),
                            SizedBox(width: 10)
                          ],
                        )),
                    btOnGoing(context),
                    btSubmit(context),
                    btFeedback(context)
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Visibility btFeedback(BuildContext context) {
    return Visibility(
      visible: (widget.status == 'Finish') ? true : false,
      child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [Button(color: Colors.blue, label: 'Feedback')],
          )),
    );
  }

  Visibility btSubmit(BuildContext context) {
    return Visibility(
      visible: (widget.status == 'Waiting List' || widget.status == 'On Going')
          ? true
          : false,
      child: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Form(
                      child: Container(
                        height: 300,
                        width: 600,
                        child: Column(
                          children: [
                            Expanded(
                              child: TextField(
                                  controller: txtFeedback,
                                  maxLines: 100,
                                  style: TextStyle(
                                      fontFamily: 'Poppins', fontSize: 14),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder())),
                            ),
                            SizedBox(height: 5),
                            GestureDetector(
                              onTap: () {
                                EasyLoading.show(
                                    status: 'Loading',
                                    maskType: EasyLoadingMaskType.black);
                                TicketModel.putStatusTicket(
                                        widget.ticketID, '2', txtFeedback.text)
                                    .then((value) {
                                  if (value == 'success') {
                                    EasyLoading.dismiss();
                                    Alert(
                                        context: context,
                                        title: 'Noted!',
                                        desc: 'Ticket Finished!',
                                        type: AlertType.success,
                                        buttons: [
                                          DialogButton(
                                              color: Color.fromRGBO(
                                                  80, 110, 228, 1),
                                              child: Text('OK',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              onPressed: () {
                                                setState(() {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                });
                                              })
                                        ]).show();
                                  } else {
                                    EasyLoading.dismiss();
                                    Alert(
                                        context: context,
                                        title: 'Failed!',
                                        desc: 'Ticket update failed!',
                                        type: AlertType.error,
                                        buttons: [
                                          DialogButton(
                                              color: Color.fromRGBO(
                                                  80, 110, 228, 1),
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Button(label: 'Submit', color: Colors.green),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          child: Button(color: Colors.green, label: 'Finish')),
    );
  }

  Visibility btOnGoing(BuildContext context) {
    return Visibility(
      visible: (widget.status == 'Waiting List') ? true : false,
      child: GestureDetector(
          onTap: () {
            EasyLoading.show(
                status: 'Loading', maskType: EasyLoadingMaskType.black);
            TicketModel.putStatusTicket(widget.ticketID, '1', '').then((value) {
              if (value == 'success') {
                EasyLoading.dismiss();
                Alert(
                    context: context,
                    title: 'Noted!',
                    desc: 'Ticket On Going!',
                    type: AlertType.success,
                    buttons: [
                      DialogButton(
                          color: Color.fromRGBO(80, 110, 228, 1),
                          child:
                              Text('OK', style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            });
                          })
                    ]).show();
              } else {
                EasyLoading.dismiss();
                Alert(
                    context: context,
                    title: 'Failed!',
                    desc: 'Ticket update failed!',
                    type: AlertType.error,
                    buttons: [
                      DialogButton(
                          color: Color.fromRGBO(80, 110, 228, 1),
                          child:
                              Text('OK', style: TextStyle(color: Colors.white)),
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
    );
  }

  GestureDetector btBack(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Button(color: Colors.red, label: 'Back'));
  }
}

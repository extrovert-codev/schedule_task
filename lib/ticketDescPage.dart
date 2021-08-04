import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:schedule_task/_model/gridView/ticketModel.dart';
import 'package:schedule_task/_widget/button.dart';
import 'package:schedule_task/_widget/editTickets.dart';

class TicketDescPage extends StatefulWidget {
  const TicketDescPage(
      {Key? key,
      required this.empID,
      required this.ticketID,
      required this.picID,
      required this.subject,
      required this.valPriority,
      required this.statusname,
      required this.tsID,
      required this.feedback})
      : super(key: key);

  final empID,
      ticketID,
      picID,
      subject,
      valPriority,
      statusname,
      tsID,
      feedback;

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
                    // btEdit(context),
                    Visibility(
                        visible: (widget.empID == widget.tsID) ? true : false,
                        child: btOnGoing(context)),
                    Visibility(
                        visible: (widget.empID == widget.tsID) ? true : false,
                        child: btFinish(context)),
                    btFeedback(context)
                  ],
                ))
          ],
        ),
      ),
    );
  }

  GestureDetector btBack(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Button(color: Colors.red, label: 'Back'));
  }

  GestureDetector btEdit(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Form(
                      child: Container(
                    height: 400,
                    width: 600,
                    child: EditTickets(
                        ticketID: widget.ticketID,
                        picID: widget.picID,
                        subject: widget.subject,
                        valPriority: widget.valPriority,
                        tsID: widget.tsID),
                  )),
                );
              });
        },
        child: Row(
          children: [
            Button(color: Color.fromRGBO(80, 110, 228, 1), label: 'Edit'),
            SizedBox(width: 10)
          ],
        ));
  }

  Visibility btOnGoing(BuildContext context) {
    return Visibility(
      visible: (widget.statusname == 'Waiting List') ? true : false,
      child: GestureDetector(
          onTap: () {
            EasyLoading.show(
                status: 'Loading', maskType: EasyLoadingMaskType.black);
            TicketModel.putStatusTicket(widget.ticketID, '1', '', '')
                .then((value) {
              if (value == 'success') {
                EasyLoading.dismiss();
                Alert(
                    context: context,
                    title: 'Noted!',
                    desc: 'Ticket on going! :)',
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
                    title: 'Opss!',
                    desc: 'Ticket gagal terupdate :(',
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

  Visibility btFinish(BuildContext context) {
    return Visibility(
      visible: (widget.statusname == 'Waiting List' ||
              widget.statusname == 'On Going')
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
                                        hintText: 'Done',
                                        hintStyle: TextStyle(
                                            color: Color.fromRGBO(
                                                101, 109, 154, 1),
                                            fontFamily: 'Poppins',
                                            fontSize: 14),
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder()))),
                            SizedBox(height: 5),
                            GestureDetector(
                              onTap: () {
                                EasyLoading.show(
                                    status: 'Loading',
                                    maskType: EasyLoadingMaskType.black);
                                TicketModel.putStatusTicket(
                                        widget.ticketID,
                                        '2',
                                        (txtFeedback.text == '')
                                            ? 'Done'
                                            : txtFeedback.text,
                                        'true')
                                    .then((value) {
                                  if (value == 'success') {
                                    EasyLoading.dismiss();
                                    Alert(
                                        context: context,
                                        title: 'Done!',
                                        desc: 'Ticket selesai! :)',
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
                                        title: 'Opss!',
                                        desc: 'Ticket gagal terupdate :(',
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

  Visibility btFeedback(BuildContext context) {
    return Visibility(
      visible: (widget.statusname == 'Finish') ? true : false,
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
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(158, 158, 158, 1)),
                                    borderRadius: BorderRadius.circular(3.5)),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(widget.feedback,
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 14)),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Button(label: 'Back', color: Colors.red),
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
          child: Row(
            children: [Button(color: Colors.blue, label: 'Feedback')],
          )),
    );
  }
}

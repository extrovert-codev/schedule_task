import 'package:flutter/material.dart';
import 'package:schedule_task/model/addTickets/PICModel.dart';
import 'package:schedule_task/model/addTickets/TSModel.dart';
import 'button.dart';

class AddTickets extends StatefulWidget {
  const AddTickets({Key? key}) : super(key: key);

  @override
  _AddTicketsState createState() => _AddTicketsState();
}

enum ValPriority { low, medium, critical }

class _AddTicketsState extends State<AddTickets> {
  TextEditingController txtSubject = TextEditingController();

  ValPriority? valPriority = ValPriority.low;
  String? tsSelectedValue, picSelectedValue;

  List<dynamic> picData = [];
  List<dynamic> tsData = [];

  Future addDropDownItems() async {
    picData = [];
    PICModel.execAPI().then((value) {
      setState(() {
        picData = value;
      });
    });

    tsData = [];
    TSModel.execAPI().then((value) {
      setState(() {
        tsData = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    this.addDropDownItems();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Technical Support',
                      style: TextStyle(
                          color: Color.fromRGBO(101, 109, 154, 1),
                          fontFamily: 'Poppins',
                          fontSize: 13)),
                  SizedBox(height: 5),
                  SizedBox(
                    height: 40,
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: Color.fromRGBO(158, 158, 158, 1))),
                      child: Center(
                          child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: Text('Select TS',
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14)),
                          value: tsSelectedValue,
                          isExpanded: true,
                          items: tsData.map((value) {
                            return DropdownMenuItem(
                                value: value['employee_id'].toString(),
                                child: Text(value['name'].toString(),
                                    style: TextStyle(
                                        fontFamily: 'Poppins', fontSize: 14)));
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              tsSelectedValue = val.toString();
                            });
                          },
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 40),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Priority',
                      style: TextStyle(
                          color: Color.fromRGBO(101, 109, 154, 1),
                          fontFamily: 'Poppins',
                          fontSize: 13)),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                                activeColor: Color.fromRGBO(80, 110, 228, 1),
                                value: ValPriority.low,
                                groupValue: valPriority,
                                onChanged: (ValPriority? val) {
                                  setState(() {
                                    valPriority = val;
                                  });
                                }),
                            Text('Low')
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: Color.fromRGBO(80, 110, 228, 1),
                                value: ValPriority.medium,
                                groupValue: valPriority,
                                onChanged: (ValPriority? val) {
                                  setState(() {
                                    valPriority = val;
                                  });
                                }),
                            Text('Medium')
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: Color.fromRGBO(80, 110, 228, 1),
                                value: ValPriority.critical,
                                groupValue: valPriority,
                                onChanged: (ValPriority? val) {
                                  setState(() {
                                    valPriority = val;
                                  });
                                }),
                            Text('Critical')
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(children: [
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PIC',
                    style: TextStyle(
                        color: Color.fromRGBO(101, 109, 154, 1),
                        fontFamily: 'Poppins',
                        fontSize: 13)),
                SizedBox(height: 5),
                SizedBox(
                  height: 40,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Color.fromRGBO(158, 158, 158, 1))),
                    child: Center(
                        child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text('Select PIC',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 14)),
                        value: picSelectedValue,
                        isExpanded: true,
                        items: picData.map((value) {
                          return DropdownMenuItem(
                              value: value['employee_id'].toString(),
                              child: Text(value['name'].toString(),
                                  style: TextStyle(
                                      fontFamily: 'Poppins', fontSize: 14)));
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            picSelectedValue = val.toString();
                          });
                        },
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          Flexible(
              flex: 1,
              child: LabelKu(label: 'PIC Site', content: 'ini kontent nay')),
          SizedBox(width: 20),
          Flexible(
              flex: 1,
              child:
                  LabelKu(label: 'PIC Department', content: 'ini kontent nay')),
          SizedBox(width: 20),
          Flexible(
              flex: 1,
              child: LabelKu(label: 'PIC Position', content: 'ini kontent nay'))
        ]),
        SizedBox(height: 10),
        Flexible(
            flex: 2,
            child: TextBox(
                controller: txtSubject, label: 'Subject', readOnly: false)),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () {},
                child: Button(label: 'Save', color: Colors.green)),
            SizedBox(width: 10),
            Button(label: 'Delete', color: Colors.red)
          ],
        )
      ],
    );
  }
}

class LabelKu extends StatelessWidget {
  const LabelKu({Key? key, required this.label, required this.content})
      : super(key: key);

  final label, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                color: Color.fromRGBO(101, 109, 154, 1),
                fontFamily: 'Poppins',
                fontSize: 13)),
        SizedBox(height: 5),
        Container(
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(158, 158, 158, 1)),
              borderRadius: BorderRadius.circular(3.5)),
          child: Center(
            child: Text(content,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
          ),
        ),
      ],
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox(
      {Key? key,
      required this.controller,
      required this.label,
      required this.readOnly})
      : super(key: key);

  final controller, label, readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                color: Color.fromRGBO(101, 109, 154, 1),
                fontFamily: 'Poppins',
                fontSize: 13)),
        SizedBox(height: 5),
        SizedBox(
          height: 150,
          child: TextField(
              controller: controller,
              readOnly: readOnly,
              maxLines: 100,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder())),
        ),
      ],
    );
  }
}

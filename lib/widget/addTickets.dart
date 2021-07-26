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
  String? picDept, picPos, picSite;

  List<dynamic> picData = [];
  List<dynamic> tsData = [];

  Future addDropDownItems() async {
    picData = [];
    picDept = '';
    picPos = '';
    picSite = '';
    PICModel.getPIC().then((value) {
      setState(() {
        picData = value.listPICData;
      });
    });

    tsData = [];
    TSModel.getTS().then((value) {
      setState(() {
        tsData = value.listTSData;
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
                          hint: Text('--Select TS--',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14)),
                          value: tsSelectedValue,
                          isExpanded: true,
                          items: tsData.map((value) {
                            return DropdownMenuItem(
                                value: value['employee_id'].toString(),
                                child: Text(
                                    value['name'].toString() +
                                        ' | ' +
                                        value['nik'].toString(),
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
                        radioButtonKu(ValPriority.low, 'Low'),
                        radioButtonKu(ValPriority.medium, 'Medium'),
                        radioButtonKu(ValPriority.critical, 'Critical')
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
                        hint: Text('--Select PIC--',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 14)),
                        value: picSelectedValue,
                        isExpanded: true,
                        items: picData.map((value) {
                          return DropdownMenuItem(
                              value: value['employee_id'].toString(),
                              child: Text(
                                  value['name'].toString() +
                                      ' | ' +
                                      value['nik'].toString(),
                                  style: TextStyle(
                                      fontFamily: 'Poppins', fontSize: 14)));
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            picSelectedValue = val.toString();
                            PICDetailModel.getPICDetail(picSelectedValue)
                                .then((value) {
                              setState(() {
                                picDept = value.listPICDetailData[0]
                                        ['department']
                                    .toString();
                                picPos = value.listPICDetailData[0]['position']
                                    .toString();
                                picSite = value.listPICDetailData[0]['site']
                                    .toString();
                              });
                            });
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
              flex: 1, child: LabelKu(label: 'PIC Site', content: picSite)),
          SizedBox(width: 20),
          Flexible(
              flex: 1,
              child: LabelKu(label: 'PIC Department', content: picDept)),
          SizedBox(width: 20),
          Flexible(
              flex: 1, child: LabelKu(label: 'PIC Position', content: picPos))
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

  Row radioButtonKu(ValPriority value, label) {
    return Row(
      children: [
        Radio(
            activeColor: Color.fromRGBO(80, 110, 228, 1),
            value: value,
            groupValue: valPriority,
            onChanged: (ValPriority? val) {
              setState(() {
                valPriority = val;
              });
            }),
        Text(label)
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

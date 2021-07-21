import 'package:flutter/material.dart';
import 'package:schedule_task/model/addTickets/PICModel.dart';
import 'button.dart';

class AddTickets extends StatefulWidget {
  const AddTickets({Key? key}) : super(key: key);

  @override
  _AddTicketsState createState() => _AddTicketsState();
}

enum ValPriority { low, medium, critical }

class _AddTicketsState extends State<AddTickets> {
  ValPriority? valPriority = ValPriority.low;
  String? supporterSelectedValue, picSelectedValue;

  List<dynamic> picID = [];
  List<dynamic> picName = [];

  Future refreshData() async {
    picID = [];
    picName = [];

    PICModel.execAPI().then((value) {
      setState(() {
        if (value != []) {
          for (int i = 0; i < value.length; i++) {
            picID.add(value[i].employeeID);
            picName.add(value[i].name);
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
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
                  Text('Supporter',
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
                          value: supporterSelectedValue,
                          isExpanded: true,
                          items: ['One', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: TextStyle(
                                        fontFamily: 'Poppins', fontSize: 14)));
                          }).toList(),
                          onChanged: (String? val) {
                            setState(() {
                              supporterSelectedValue = val;
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
          Flexible(flex: 1, child: TextBox(label: 'PIC')),
          SizedBox(width: 40),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PIC Dept',
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
                        value: picSelectedValue,
                        isExpanded: true,
                        items: picName.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(
                                      fontFamily: 'Poppins', fontSize: 14)));
                        }).toList(),
                        onChanged: (String? val) {
                          setState(() {
                            picSelectedValue = val;
                          });
                        },
                      ),
                    )),
                  ),
                ),
              ],
            ),
          )
        ]),
        SizedBox(height: 10),
        Flexible(flex: 2, child: TextBox(label: 'Subject')),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: (){
                 refreshData();
              },
              child: Button(label: 'Save', color: Colors.green)),
            SizedBox(width: 10),
            Button(label: 'Delete', color: Colors.red)
          ],
        )
      ],
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({Key? key, required this.label}) : super(key: key);

  final label;

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
          height: (label == 'Subject') ? 150 : 40,
          child: TextField(
              maxLines: (label == 'Subject') ? 100 : 1,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
              decoration: InputDecoration(
                  contentPadding: (label == 'Subject')
                      ? EdgeInsets.all(10)
                      : EdgeInsets.only(left: 10, right: 10),
                  border: OutlineInputBorder())),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'button.dart';

class AddTickets extends StatelessWidget {
  const AddTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(flex: 1, child: TextBox(label: 'Supporter')),
            SizedBox(width: 40),
            Flexible(flex: 1, child: TextBox(label: 'PIC')),
            SizedBox(width: 40),
            Flexible(flex: 1, child: TextBox(label: 'PIC Dept'))
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                child: Column(
                  children: [
                    TextBox(label: 'Priority'),
                    SizedBox(height: 10),
                    TextBox(label: 'Status')
                  ],
                ),
              ),
            ),
            SizedBox(width: 40),
            Flexible(flex: 2, child: TextBox(label: 'Subject')),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Container(
                              height: 100, width: 100, color: Colors.white),
                        );
                      });
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
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(233, 236, 239, 1))))),
        ),
      ],
    );
  }
}

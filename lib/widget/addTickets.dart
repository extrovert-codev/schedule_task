import 'package:flutter/material.dart';

class AddTickets extends StatelessWidget {
  const AddTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Flexible(flex: 1, child: TextBox(hint: 'Subject')),
              SizedBox(width: 50),
              Flexible(flex: 1, child: TextBox(hint: 'Subject'))
            ],
          )
        ],
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({Key? key, required this.hint}) : super(key: key);

  final hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: TextField(
            style: TextStyle(fontFamily: 'Poppins'),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                hintText: hint,
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(233, 236, 239, 1))))));
  }
}

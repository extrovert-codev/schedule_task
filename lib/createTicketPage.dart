import 'package:flutter/material.dart';

class CreateTicketPage extends StatefulWidget {
  const CreateTicketPage({Key? key}) : super(key: key);

  @override
  _CreateTicketPageState createState() => _CreateTicketPageState();
}

class _CreateTicketPageState extends State<CreateTicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Row(
            children: [
              Container(
                width: 250,
                child: Column(
                  children: [
                    Text('PIC'),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

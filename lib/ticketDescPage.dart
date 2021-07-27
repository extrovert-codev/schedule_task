import 'package:flutter/material.dart';
import 'package:schedule_task/widget/button.dart';

class TicketDescPage extends StatelessWidget {
  const TicketDescPage({Key? key, required this.subject}) : super(key: key);

  final subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(height: 500, color: Colors.amber, child: Text(subject)),
          Button(color: Colors.red, label: 'Back')
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Cek extends StatefulWidget {
  const Cek({Key? key}) : super(key: key);

  @override
  _CekState createState() => _CekState();
}

class _CekState extends State<Cek> {
  double tot = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: tot,
            height: 3,
            color: Colors.red,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: tot,
            height: 3,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

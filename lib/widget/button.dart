import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.label, required this.color})
      : super(key: key);

  final label, color;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
          height: 34,
          width: 80,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Text(label,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 12)))),
    );
  }
}

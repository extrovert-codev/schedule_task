import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 38),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.notifications_none,
              color: Color.fromRGBO(112, 129, 185, 1), size: 30),
          Container(
              margin: EdgeInsets.only(left: 17, right: 12),
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(112, 129, 185, 1),
                  borderRadius: BorderRadius.circular(100))),
          Text('Dika',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color.fromRGBO(112, 129, 185, 1))),
          Icon(Icons.keyboard_arrow_down,
              color: Color.fromRGBO(112, 129, 185, 1), size: 15)
        ],
      ),
    );
  }
}

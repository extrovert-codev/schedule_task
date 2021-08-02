import 'package:flutter/material.dart';

class MyStatus extends StatelessWidget {
  const MyStatus(
      {Key? key,
      required this.color,
      required this.ico,
      required this.cnt,
      required this.title})
      : super(key: key);

  final ico, cnt, title, color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: Card(
          elevation: 3,
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 30),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Icon(ico, size: 50, color: color),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(cnt,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      SizedBox(height: 5),
                      Stack(children: [
                        Container(height: 3, color: Colors.grey[300]),
                        Container(height: 3, width: 100, color: color)
                      ]),
                      SizedBox(height: 5),
                      Text(title,
                          style: TextStyle(
                              color: Color.fromRGBO(173, 171, 197, 1),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}

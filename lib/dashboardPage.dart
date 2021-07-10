import 'package:flutter/material.dart';
import 'package:schedule_task/Widget/sideBar.dart';
import 'package:schedule_task/widget/topBar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color.fromRGBO(237, 240, 245, 1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SideBar(),
              Expanded(
                child: Column(
                  children: [
                    TopBar(),
                    Expanded(
                        child: SizedBox(
                      child: ListView(
                        padding: EdgeInsets.all(30),
                        children: [
                          Container(
                              height: 80,
                              child: Row(
                                children: [
                                  MyStatus(
                                      color: Color.fromRGBO(41, 178, 237, 1),
                                      ico: Icons.tag,
                                      cnt: '2',
                                      title: 'TICKETS ON GOING'),
                                  SizedBox(width: 50),
                                  MyStatus(
                                      color: Color.fromRGBO(45, 223, 214, 1),
                                      ico: Icons.check,
                                      cnt: '467',
                                      title: 'TICKETS COMPLETE'),
                                  SizedBox(width: 50),
                                  MyStatus(
                                      color: Color.fromRGBO(255, 94, 219, 1),
                                      ico: Icons.hourglass_bottom,
                                      cnt: '128:07 min',
                                      title: 'HOURS WORKED'),
                                ],
                              )),
                          SizedBox(height: 25),
                          Expanded(
                            child: Card(
                              elevation: 3,
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                                  height: 500,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('My Tickets',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  48, 62, 103, 1),
                                              fontFamily: 'Poppins',
                                              fontSize: 16)),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: SizedBox(
                                            child: Row(
                                              children: [
                                                Text('Show',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            101, 109, 154, 1),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 13)),
                                                SizedBox(width: 5),
                                                SizedBox(
                                                    height: 35,
                                                    width: 60,
                                                    child: TextField(
                                                        decoration: InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    right: 10),
                                                            border: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            233,
                                                                            236,
                                                                            239,
                                                                            1)))))),
                                                SizedBox(width: 5),
                                                Text('entires',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            101, 109, 154, 1),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 13)),
                                              ],
                                            ),
                                          )),
                                          Search()
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Text('Search:',
              style: TextStyle(
                  color: Color.fromRGBO(101, 109, 154, 1),
                  fontFamily: 'Poppins',
                  fontSize: 13)),
          SizedBox(width: 10),
          SizedBox(
              height: 35,
              width: 200,
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(233, 236, 239, 1))))))
        ],
      ),
    );
  }
}

class MyStatus extends StatelessWidget {
  const MyStatus(
      {Key? key,
      required this.color,
      required this.ico,
      required this.cnt,
      required this.title})
      : super(key: key);

  final IconData ico;
  final String cnt, title;
  final Color color;

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
                      Container(height: 3, color: color),
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

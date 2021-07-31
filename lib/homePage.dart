import 'package:flutter/material.dart';
import 'package:schedule_task/model/gridView/myStatusModel.dart';
import 'package:schedule_task/widget/homePage/myStatus.dart';
import 'package:schedule_task/widget/gridViewKu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.empID}) : super(key: key);

  final empID;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? ongoing, finish, timeWork;

  void refreshData() {
    ongoing = 0;
    finish = 0;

    MyStatusModel.getMyStatus(widget.empID).then((value) {
      setState(() {
        ongoing = value.listMyStatusData[0]['ongoing'];
        finish = value.listMyStatusData[0]['finish'];
        timeWork = value.listMyStatusData[0]['totalmin'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    this.refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Container(
            height: 80,
            child: Row(children: [
              MyStatus(
                  color: Color.fromRGBO(41, 178, 237, 1),
                  ico: Icons.timeline,
                  cnt: ongoing.toString(),
                  title: 'TICKETS ON GOING'),
              SizedBox(width: 50),
              MyStatus(
                  color: Color.fromRGBO(45, 223, 214, 1),
                  ico: Icons.check,
                  cnt: finish.toString(),
                  title: 'TICKETS COMPLETE'),
              SizedBox(width: 50),
              MyStatus(
                  color: Color.fromRGBO(255, 94, 219, 1),
                  ico: Icons.hourglass_bottom,
                  cnt: (timeWork == null)
                      ? '0 min'
                      : timeWork.toString() + ' min',
                  title: 'HOURS WORKED')
            ])),
        SizedBox(height: 25),
        Card(
          elevation: 3,
          child: Container(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              height: 600,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('My Tickets',
                        style: TextStyle(
                            color: Color.fromRGBO(48, 62, 103, 1),
                            fontFamily: 'Poppins',
                            fontSize: 16)),
                    SizedBox(height: 18),
                    Expanded(
                        child: Container(
                      child: GridViewKu(cntData: 2, empID: widget.empID),
                    ))
                  ])),
        ),
      ],
    );
  }
}

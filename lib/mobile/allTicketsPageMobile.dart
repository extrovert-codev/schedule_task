import 'package:flutter/material.dart';
import 'package:schedule_task/_widget/gridViewKuMobile.dart';

class AllTicketsPageMobile extends StatelessWidget {
  const AllTicketsPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Text('All Tickets',
            style: TextStyle(
                color: Color.fromRGBO(112, 129, 185, 1),
                fontFamily: 'Poppins',
                fontSize: 18)),
        SizedBox(height: 15),
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
                    Text('Ticket Lists',
                        style: TextStyle(
                            color: Color.fromRGBO(48, 62, 103, 1),
                            fontFamily: 'Poppins',
                            fontSize: 16)),
                    SizedBox(height: 18),
                    Expanded(
                        child: Container(
                      child: GridViewKuMobile(
                          isAll: true, cntData: 10, empID: null),
                    )),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Showing 1 to 16 of 100 entries',
                            style: TextStyle(
                                color: Color.fromRGBO(48, 62, 103, 1),
                                fontFamily: 'Poppins',
                                fontSize: 14)),
                        Row(children: [
                          Container(
                              height: 34,
                              width: 83,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(234, 240, 249, 1)),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5))),
                              child: Center(
                                  child: Text('Previous',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(187, 197, 229, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 14)))),
                          Container(
                              height: 34,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(80, 110, 228, 1)),
                              child: Center(
                                  child: Text('1',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 14)))),
                          Container(
                              height: 34,
                              width: 55,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(234, 240, 249, 1)),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5))),
                              child: Center(
                                  child: Text('Next',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(187, 197, 229, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 14)))),
                        ])
                      ],
                    )
                  ])),
        ),
      ],
    );
  }
}

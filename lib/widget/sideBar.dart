import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_task/allTicketsPage.dart';
import 'package:schedule_task/dashboardPage.dart';
import 'package:schedule_task/myTicketsPage.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      color: Color.fromRGBO(80, 110, 228, 1),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 30),
                    width: 50,
                    height: 50,
                    child: Image.asset('images/Trisco.png', fit: BoxFit.fill),
                  ),
                  Menu(tooltip: 'Home', ico: Icons.home, page: DashboardPage()),
                  Menu(
                      tooltip: 'My Ticket',
                      ico: Icons.list,
                      page: MyTicketsPage()),
                  Menu(
                      tooltip: 'All Ticket',
                      ico: Icons.list_alt,
                      page: AllTicketsPage()),
                ],
              ),
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 25),
                    width: 25,
                    height: 25,
                    child: Icon(Icons.chat_rounded,
                        color: Color.fromRGBO(190, 202, 230, 1))),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu(
      {Key? key, required this.tooltip, required this.ico, required this.page})
      : super(key: key);

  final tooltip;
  final ico;
  final page;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(5)),
      textStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w600),
      child: GestureDetector(
        onTap: () {
          Get.off(page);
        },
        child: Container(
          margin: EdgeInsets.only(top: 45),
          width: 25,
          height: 25,
          child: Icon(ico, color: Color.fromRGBO(190, 202, 230, 1)),
        ),
      ),
    );
  }
}

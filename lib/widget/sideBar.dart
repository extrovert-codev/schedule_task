import 'package:flutter/material.dart';

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
                    color: Colors.amber,
                  ),
                  Menu(),
                  Menu(),
                  Menu(),
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
                  color: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 36,
                  height: 36,
                  color: Colors.amber,
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
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 45),
      width: 22,
      height: 22,
      color: Colors.amber,
    );
  }
}

import 'package:flutter/material.dart';

class GridViewKu extends StatefulWidget {
  const GridViewKu({Key? key, required this.cntData}) : super(key: key);

  final cntData;

  @override
  _GridViewKuState createState() => _GridViewKuState();
}

class _GridViewKuState extends State<GridViewKu> {
  bool isHovering = false;
  bool isCheckboxShow = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ShowEntries(), Search()]),

        // Columns
        Container(
            height: 1.5,
            margin: EdgeInsets.only(top: 8),
            color: Colors.grey[300]),
        Container(
            height: 65,
            padding: EdgeInsets.only(left: 15, right: 15),
            color: Color.fromRGBO(241, 245, 250, 1),
            child: Row(children: [
              Visibility(
                  visible: isCheckboxShow,
                  child: Checkbox(value: false, onChanged: (val) {})),
              Container(
                  margin: EdgeInsets.only(left: 30),
                  width: 80,
                  child: Text('ID',
                      style: TextStyle(
                          color: Color.fromRGBO(48, 62, 103, 1),
                          fontFamily: 'Poppins',
                          fontSize: 13))),
              ColumnKu(width: 70, title: 'PIC'),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 70),
                      child: Text('Subject',
                          style: TextStyle(
                              color: Color.fromRGBO(48, 62, 103, 1),
                              fontFamily: 'Poppins',
                              fontSize: 13)))),
              ColumnKu(width: 150, title: 'Priority'),
              ColumnKu(width: 150, title: 'Status'),
              ColumnKu(width: 150, title: 'Support by'),
              ColumnKu(width: 150, title: 'Response Time'),
            ])),
        Container(height: 1.5, color: Colors.grey[300]),

        // Data
        Expanded(
          child: SizedBox(
            child: ListView.separated(
                padding: EdgeInsets.only(top: 5),
                itemBuilder: (context, i) => Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          color: Colors.white,
                          child: Row(children: [
                            Visibility(
                                visible: isCheckboxShow,
                                child: Checkbox(
                                    value: false, onChanged: (val) {})),
                            Container(
                                margin: EdgeInsets.only(left: 30),
                                width: 80,
                                child: Text('#$i',
                                    style: TextStyle(
                                        color: Color.fromRGBO(48, 62, 103, 1),
                                        fontFamily: 'Poppins',
                                        fontSize: 13))),
                            DataKu(width: 70, content: 'PIC'),
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(left: 70),
                                    child: Text('Subject',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(48, 62, 103, 1),
                                            fontFamily: 'Poppins',
                                            fontSize: 13)))),
                            DataKu(width: 150, content: 'Priority'),
                            DataKu(width: 150, content: 'Status'),
                            DataKu(width: 150, content: 'Support by'),
                            DataKu(width: 150, content: 'Response Time'),
                          ]),
                        ),
                      ),
                    ),
                separatorBuilder: (context, i) => Divider(),
                itemCount: widget.cntData),
          ),
        )
      ],
    );
  }
}

class ColumnKu extends StatelessWidget {
  const ColumnKu({Key? key, required this.width, required this.title})
      : super(key: key);

  final width;
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: Text(title,
            style: TextStyle(
                color: Color.fromRGBO(48, 62, 103, 1),
                fontFamily: 'Poppins',
                fontSize: 13)));
  }
}

class DataKu extends StatelessWidget {
  const DataKu({Key? key, required this.width, required this.content})
      : super(key: key);

  final width;
  final content;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: Text(content,
            style: TextStyle(
                color: Color.fromRGBO(48, 62, 103, 1),
                fontFamily: 'Poppins',
                fontSize: 13)));
  }
}

class ShowEntries extends StatelessWidget {
  const ShowEntries({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Show',
            style: TextStyle(
                color: Color.fromRGBO(101, 109, 154, 1),
                fontFamily: 'Poppins',
                fontSize: 13)),
        SizedBox(width: 5),
        SizedBox(
          height: 35,
          width: 60,
          child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10, right: 10),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(233, 236, 239, 1))))),
        ),
        SizedBox(width: 5),
        Text('entires',
            style: TextStyle(
                color: Color.fromRGBO(101, 109, 154, 1),
                fontFamily: 'Poppins',
                fontSize: 13)),
      ],
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
          Text('Search',
              style: TextStyle(
                  color: Color.fromRGBO(101, 109, 154, 1),
                  fontFamily: 'Poppins',
                  fontSize: 13)),
          SizedBox(width: 5),
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

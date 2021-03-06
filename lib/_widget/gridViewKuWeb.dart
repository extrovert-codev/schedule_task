import 'package:flutter/material.dart';
import 'package:schedule_task/_model/gridView/ticketModel.dart';
import 'package:schedule_task/ticketDescPage.dart';

class GridViewKuWeb extends StatefulWidget {
  const GridViewKuWeb(
      {Key? key, this.isAll, required this.cntData, required this.empID})
      : super(key: key);

  final isAll, cntData, empID;

  @override
  _GridViewKuWebState createState() => _GridViewKuWebState();
}

class _GridViewKuWebState extends State<GridViewKuWeb> {
  bool isLoading = false;
  bool isHovering = false;
  bool isCheckboxShow = false;

  List<dynamic> gridData = [];

  void refreshData() {
    isLoading = true;
    gridData = [];
    TicketModel.getTicket(widget.empID).then((value) {
      setState(() {
        if (value.listTicketData != null) {
          gridData = value.listTicketData;
        }
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading == true)
        ? Center(child: CircularProgressIndicator())
        : Column(
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
                  height: 65.0,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  color: Color.fromRGBO(241, 245, 250, 1),
                  child: Row(children: [
                    Visibility(
                        visible: isCheckboxShow,
                        child: Checkbox(value: false, onChanged: (val) {})),
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        width: 80.0,
                        child: Text('ID',
                            style: TextStyle(
                                color: Color.fromRGBO(48, 62, 103, 1),
                                fontFamily: 'Poppins',
                                fontSize: 13))),
                    ColumnKu(width: 70.0, title: 'PIC'),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 70),
                            child: Text('Subject',
                                style: TextStyle(
                                    color: Color.fromRGBO(48, 62, 103, 1),
                                    fontFamily: 'Poppins',
                                    fontSize: 13)))),
                    ColumnKu(width: 100.0, title: 'Priority'),
                    ColumnKu(width: 150.0, title: 'Status'),
                    ColumnKu(width: 150.0, title: 'Technical Support'),
                    Visibility(
                        visible: (widget.isAll == true) ? true : false,
                        child: ColumnKu(width: 150.0, title: 'Feedback')),
                    ColumnKu(width: 150.0, title: 'Response Time'),
                  ])),
              Container(height: 1.5, color: Colors.grey[300]),

              // Data
              Expanded(
                child: SizedBox(
                  child: ListView.separated(
                      padding: EdgeInsets.only(top: 5),
                      itemBuilder: (context, i) => (gridData.length == 0)
                          ? Container()
                          : Container(
                              height: 40.0,
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return TicketDescPage(
                                        empID: widget.empID,
                                        ticketID:
                                            gridData[i]['ticket_id'].toString(),
                                        picID: gridData[i]['pic_id'].toString(),
                                        valPriority:
                                            gridData[i]['priority'].toString(),
                                        tsID: gridData[i]['technicalsupport_id']
                                            .toString(),
                                        statusname: gridData[i]['statusname']
                                            .toString(),
                                        subject:
                                            gridData[i]['subject'].toString(),
                                        feedback:
                                            gridData[i]['feedback'].toString(),
                                      );
                                    })).whenComplete(() => refreshData());
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    child: Row(children: [
                                      Visibility(
                                          visible: isCheckboxShow,
                                          child: Checkbox(
                                              value: false,
                                              onChanged: (val) {})),
                                      Container(
                                          margin: EdgeInsets.only(left: 30),
                                          width: 80.0,
                                          child: Text(
                                              '#' +
                                                  gridData[i]['ticket_id']
                                                      .toString(),
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      48, 62, 103, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 13))),
                                      DataKu(
                                          width: 70.0,
                                          content: gridData[i]['picname']
                                              .toString()),
                                      Expanded(
                                          child: Container(
                                              margin: EdgeInsets.only(left: 70),
                                              child: Text(
                                                  gridData[i]['subject']
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(
                                                          color: Color.fromRGBO(
                                                              48, 62, 103, 1),
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13)))),
                                      DataKu(
                                          width: 100.0,
                                          content: gridData[i]['priorityname']
                                              .toString()),
                                      DataKu(
                                          width: 150.0,
                                          content: gridData[i]['statusname']
                                              .toString()),
                                      DataKu(
                                          width: 150.0,
                                          content: gridData[i]
                                                  ['technicalsupportname']
                                              .toString()),
                                      Visibility(
                                          visible: (widget.isAll == true)
                                              ? true
                                              : false,
                                          child: DataKu(
                                              width: 150.0,
                                              content: (gridData[i]
                                                          ['feedback'] !=
                                                      null)
                                                  ? gridData[i]['feedback']
                                                      .toString()
                                                  : '')),
                                      DataKu(
                                          width: 150.0,
                                          content:
                                              (gridData[i]['totalmin'] != null)
                                                  ? gridData[i]['totalmin']
                                                          .toString() +
                                                      ' min'
                                                  : ''),
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                      separatorBuilder: (context, i) => Divider(),
                      itemCount: gridData.length),
                ),
              )
            ],
          );
  }
}

class ColumnKu extends StatelessWidget {
  const ColumnKu({Key? key, required this.width, required this.title})
      : super(key: key);

  final width, title;

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

  final width, content;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: (content == 'Finish' ||
                content == 'Waiting List' ||
                content == 'On Going')
            ? Container(
                margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                decoration: BoxDecoration(
                    color: (content == 'Finish')
                        ? Color.fromRGBO(224, 249, 244, 1)
                        : (content == 'Waiting List')
                            ? Color.fromRGBO(255, 220, 220, 1)
                            : Color.fromRGBO(255, 244, 189, 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(content,
                      style: TextStyle(
                          color: (content == 'Finish')
                              ? Color.fromRGBO(45, 223, 214, 1)
                              : (content == 'Waiting List')
                                  ? Color.fromRGBO(255, 91, 91, 1)
                                  : Color.fromRGBO(237, 170, 41, 1),
                          fontFamily: 'Poppins',
                          fontSize: 13)),
                ),
              )
            : Text(content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: (content == 'Critical')
                        ? Color.fromRGBO(242, 77, 86, 1)
                        : Color.fromRGBO(48, 62, 103, 1),
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
          height: 40,
          width: 60,
          child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10, right: 10),
                  border: OutlineInputBorder())),
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
    return Row(
      children: [
        Text('Search',
            style: TextStyle(
                color: Color.fromRGBO(101, 109, 154, 1),
                fontFamily: 'Poppins',
                fontSize: 13)),
        SizedBox(width: 10),
        SizedBox(
            height: 40,
            width: 200,
            child: TextField(
                style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    border: OutlineInputBorder())))
      ],
    );
  }
}

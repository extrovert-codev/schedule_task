import 'package:flutter/material.dart';
import 'package:schedule_task/_model/gridView/ticketModel.dart';
import 'package:schedule_task/ticketDescPage.dart';

class GridViewKuMobile extends StatefulWidget {
  const GridViewKuMobile(
      {Key? key, this.isAll, required this.cntData, required this.empID})
      : super(key: key);

  final isAll, cntData, empID;

  @override
  _GridViewKuMobileState createState() => _GridViewKuMobileState();
}

class _GridViewKuMobileState extends State<GridViewKuMobile> {
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
              ShowEntries(),
              SizedBox(height: 10),
              Search(),
              SizedBox(height: 10),

              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(158, 158, 158, 1)),
                    borderRadius: BorderRadius.circular(3.5)),
                child: ListView.separated(
                  padding: EdgeInsets.all(5),
                  separatorBuilder: (context, i) => Divider(thickness: 3),
                  itemCount: gridData.length,
                  itemBuilder: (context, i) => (gridData.length == 0)
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return TicketDescPage(
                                empID: widget.empID,
                                ticketID: gridData[i]['ticket_id'].toString(),
                                picID: gridData[i]['pic_id'].toString(),
                                valPriority: gridData[i]['priority'].toString(),
                                tsID: gridData[i]['technicalsupport_id']
                                    .toString(),
                                statusname:
                                    gridData[i]['statusname'].toString(),
                                subject: gridData[i]['subject'].toString(),
                                feedback: gridData[i]['feedback'].toString(),
                              );
                            })).whenComplete(() => refreshData());
                          },
                          child: Column(
                            children: [
                              Row(children: [
                                Visibility(
                                    visible: isCheckboxShow,
                                    child: Checkbox(
                                        value: false, onChanged: (val) {})),
                                Visibility(
                                    visible: isCheckboxShow,
                                    child: Checkbox(
                                        value: false, onChanged: (val) {})),
                              ]),
                              Visibility(
                                  visible: isCheckboxShow, child: Divider()),
                              Row(children: [
                                ColumnKu(width: 180.0, title: 'ID'),
                                DataKu(
                                    content: '#' +
                                        gridData[i]['ticket_id'].toString())
                              ]),
                              Divider(),
                              Row(children: [
                                ColumnKu(width: 180.0, title: 'PIC'),
                                DataKu(
                                    content: gridData[i]['picname'].toString())
                              ]),
                              Divider(),
                              Row(children: [
                                ColumnKu(width: 180.0, title: 'Subject'),
                                DataKu(
                                    content: gridData[i]['subject'].toString())
                              ]),
                              Divider(),
                              Row(children: [
                                ColumnKu(width: 180.0, title: 'Priority'),
                                DataKu(
                                    content:
                                        gridData[i]['priorityname'].toString())
                              ]),
                              Divider(),
                              Row(children: [
                                ColumnKu(width: 180.0, title: 'Status'),
                                DataKu(
                                    content:
                                        gridData[i]['statusname'].toString())
                              ]),
                              Divider(),
                              Row(children: [
                                ColumnKu(
                                    width: 180.0, title: 'Technical Support'),
                                DataKu(
                                    content: gridData[i]['technicalsupportname']
                                        .toString())
                              ]),
                              Divider(),
                              Row(children: [
                                Visibility(
                                    visible:
                                        (widget.isAll == true) ? true : false,
                                    child: ColumnKu(
                                        width: 180.0, title: 'Feedback')),
                                Visibility(
                                    visible:
                                        (widget.isAll == true) ? true : false,
                                    child: DataKu(
                                        content: (gridData[i]['feedback'] !=
                                                null)
                                            ? gridData[i]['feedback'].toString()
                                            : '')),
                              ]),
                              Visibility(
                                  visible:
                                      (widget.isAll == true) ? true : false,
                                  child: Divider()),
                              Row(children: [
                                ColumnKu(width: 180.0, title: 'Response Time'),
                                DataKu(
                                    content: (gridData[i]['totalmin'] != null)
                                        ? gridData[i]['totalmin'].toString() +
                                            ' min'
                                        : '')
                              ]),
                            ],
                          ),
                        ),
                ),
              ))
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
  const DataKu({Key? key, required this.content}) : super(key: key);

  final content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: (content == 'Finish' ||
                  content == 'Waiting List' ||
                  content == 'On Going')
              ? Container(
                  decoration: BoxDecoration(
                      color: (content == 'Finish')
                          ? Color.fromRGBO(224, 249, 244, 1)
                          : (content == 'Waiting List')
                              ? Color.fromRGBO(255, 220, 220, 1)
                              : Color.fromRGBO(255, 244, 189, 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(content,
                        overflow: TextOverflow.ellipsis,
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
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: (content == 'Critical')
                          ? Color.fromRGBO(242, 77, 86, 1)
                          : Color.fromRGBO(48, 62, 103, 1),
                      fontFamily: 'Poppins',
                      fontSize: 13))),
    );
  }
}

class ShowEntries extends StatelessWidget {
  const ShowEntries({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
          keyboardType: TextInputType.number,
          style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
          decoration: InputDecoration(
              hintText: 'Show data entries',
              hintStyle: TextStyle(
                  color: Color.fromRGBO(101, 109, 154, 1),
                  fontFamily: 'Poppins',
                  fontSize: 13),
              contentPadding: EdgeInsets.only(left: 10, right: 10),
              border: OutlineInputBorder())),
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
        height: 40,
        child: TextField(
            style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
            decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Color.fromRGBO(101, 109, 154, 1),
                    fontFamily: 'Poppins',
                    fontSize: 13),
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                border: OutlineInputBorder())));
  }
}

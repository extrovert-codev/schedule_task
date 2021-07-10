import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class TicketAdminPage extends StatefulWidget {
  const TicketAdminPage({Key? key}) : super(key: key);

  @override
  _TicketAdminPageState createState() => _TicketAdminPageState();
}

class _TicketAdminPageState extends State<TicketAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 112, 129, 185)),
      ),
      body: Container(
        color: Color.fromARGB(255, 237, 240, 245),
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Text('Tickets'),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Tickets',
                        style:
                            TextStyle(color: Color.fromARGB(255, 48, 62, 103)),
                      ),
                      GFButton(
                          color: Color.fromARGB(255, 82, 112, 228),
                          text: 'Create Ticket',
                          onPressed: () {})
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Search',
                        style:
                            TextStyle(color: Color.fromARGB(255, 48, 62, 103)),
                      ),
                      SizedBox(width: 20),
                      Container(
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(),
                          ))
                    ],
                  ),
                  PaginatedDataTable(
                    rowsPerPage: 5,
                    showFirstLastButtons: true,
                    columns: [
                      DataColumn(
                          label: Checkbox(value: false, onChanged: (val) {})),
                      DataColumn(
                          label: Text('ID',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 48, 62, 103)))),
                      DataColumn(
                          label: Text('PIC',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 48, 62, 103)))),
                      DataColumn(
                          label: Text('Subject',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 48, 62, 103)))),
                      DataColumn(
                          label: Text('Priority',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 48, 62, 103)))),
                      DataColumn(
                          label: Text('Status',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 48, 62, 103)))),
                      DataColumn(
                          label: Text('Support by',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 48, 62, 103)))),
                      DataColumn(
                          label: Text('Response Time',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 48, 62, 103)))),
                    ],
                    source: DTS(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Checkbox(value: false, onChanged: (val) {})),
        DataCell(Text('#$index',
            style: TextStyle(color: Color.fromARGB(255, 114, 134, 162)))),
        DataCell(Text('PIC #$index',
            style: TextStyle(color: Color.fromARGB(255, 114, 134, 162)))),
        DataCell(Text('Subject #$index',
            style: TextStyle(color: Color.fromARGB(255, 114, 134, 162)))),
        DataCell(Text('Priority #$index',
            style: TextStyle(color: Color.fromARGB(255, 114, 134, 162)))),
        DataCell(Text('Status #$index',
            style: TextStyle(color: Color.fromARGB(255, 114, 134, 162)))),
        DataCell(Text('Support by #$index',
            style: TextStyle(color: Color.fromARGB(255, 114, 134, 162)))),
        DataCell(Text('Response Time #$index',
            style: TextStyle(color: Color.fromARGB(255, 114, 134, 162)))),
      ],
    );
  }

  @override
  int get rowCount => 9; // Manipulate this to which ever value you wish

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

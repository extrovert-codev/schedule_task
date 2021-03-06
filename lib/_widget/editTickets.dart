// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart'; 
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:schedule_task/_model/addTickets/PICModel.dart';
// import 'package:schedule_task/_model/addTickets/TSModel.dart';
// import 'package:schedule_task/_model/gridView/ticketModel.dart';
// import 'button.dart';

// class EditTickets extends StatefulWidget {
//   const EditTickets(
//       {Key? key,
//       required this.ticketID,
//       required this.picID,
//       required this.subject,
//       required this.valPriority,
//       required this.tsID})
//       : super(key: key);

//   final ticketID, picID, subject, valPriority, tsID;

//   @override
//   _EditTicketsState createState() => _EditTicketsState();
// }

// enum Priority { low, medium, critical }

// class _EditTicketsState extends State<EditTickets> {
//   bool isLoading = false;
//   TextEditingController txtSubject = TextEditingController();
//   Priority? priority;
//   int? tsSelectedValue, picSelectedValue, valPriority;
//   String? txtTS, txtTPICName, txtPicDept, txtPicPos, txtPicSite;
//   List<dynamic> picData = [], tsData = [];

//   void addDropDownItems() {
//     isLoading = true;
//     if (widget.valPriority == '0') {
//       priority = Priority.low;
//     } else if (widget.valPriority == '1') {
//       priority = Priority.medium;
//     } else {
//       priority = Priority.critical;
//     }

//     PICDetailModel.getPICDetail(widget.picID).then((value) {
//       setState(() {
//         txtPicDept = value.listPICDetailData[0]['department'];
//         txtPicPos = value.listPICDetailData[0]['position'];
//         txtPicSite = value.listPICDetailData[0]['site'];
//       });
//     });

//     tsData = [];
//     TSModel.getTS().then((value) {
//       setState(() {
//         tsData = value.listTSData;
//       });
//     });
//     isLoading = false;
//   }

//   @override
//   void initState() {
//     super.initState();
//     this.addDropDownItems();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return (isLoading == true)
//         ? Center(child: CircularProgressIndicator())
//         : Column(
//             children: [
//               Row(
//                 children: [
//                   Flexible(
//                     flex: 1,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Technical Support',
//                             style: TextStyle(
//                                 color: Color.fromRGBO(101, 109, 154, 1),
//                                 fontFamily: 'Poppins',
//                                 fontSize: 13)),
//                         SizedBox(height: 5),
//                         SizedBox(
//                           height: 40,
//                           child: Container(
//                             padding: EdgeInsets.only(left: 10, right: 10),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(4),
//                                 border: Border.all(
//                                     color: Color.fromRGBO(158, 158, 158, 1))),
//                             child: Center(
//                                 child: DropdownButtonHideUnderline(
//                               child: DropdownButton(
//                                 hint: Text('--Select TS--',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         fontFamily: 'Poppins', fontSize: 14)),
//                                 value: tsSelectedValue,
//                                 isExpanded: true,
//                                 items: tsData.map((value) {
//                                   return DropdownMenuItem(
//                                       value: value['employee_id'],
//                                       child: Text(
//                                           value['name'].toString() +
//                                               ' | ' +
//                                               value['nik'].toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'Poppins',
//                                               fontSize: 14)));
//                                 }).toList(),
//                                 onChanged: (dynamic val) {
//                                   setState(() {
//                                     tsSelectedValue = val;
//                                   });
//                                 },
//                               ),
//                             )),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 40),
//                   Flexible(
//                     flex: 1,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Priority',
//                             style: TextStyle(
//                                 color: Color.fromRGBO(101, 109, 154, 1),
//                                 fontFamily: 'Poppins',
//                                 fontSize: 13)),
//                         SizedBox(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               radioButtonKu(Priority.low, 'Low'),
//                               radioButtonKu(Priority.medium, 'Medium'),
//                               radioButtonKu(Priority.critical, 'Critical')
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height: 10),
//               Row(children: [
//                 Flexible(
//                   flex: 2,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('PIC',
//                           style: TextStyle(
//                               color: Color.fromRGBO(101, 109, 154, 1),
//                               fontFamily: 'Poppins',
//                               fontSize: 13)),
//                       SizedBox(height: 5),
//                       SizedBox(
//                         height: 40,
//                         child: Container(
//                           padding: EdgeInsets.only(left: 10, right: 10),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(4),
//                               border: Border.all(
//                                   color: Color.fromRGBO(158, 158, 158, 1))),
//                           child: Center(
//                               child: DropdownButtonHideUnderline(
//                             child: DropdownButton(
//                               hint: Text('--Select PIC--',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontFamily: 'Poppins', fontSize: 14)),
//                               value: picSelectedValue,
//                               isExpanded: true,
//                               items: picData.map((value) {
//                                 return DropdownMenuItem(
//                                     value: value['employee_id'],
//                                     child: Text(
//                                         value['name'].toString() +
//                                             ' | ' +
//                                             value['nik'].toString(),
//                                         style: TextStyle(
//                                             fontFamily: 'Poppins',
//                                             fontSize: 14)));
//                               }).toList(),
//                               onChanged: (dynamic val) {
//                                 setState(() {
//                                   picSelectedValue = val;
//                                   PICDetailModel.getPICDetail(picSelectedValue)
//                                       .then((value) {
//                                     setState(() {
//                                       txtPicDept = value.listPICDetailData[0]
//                                           ['department'];
//                                       txtPicPos = value.listPICDetailData[0]
//                                           ['position'];
//                                       txtPicSite =
//                                           value.listPICDetailData[0]['site'];
//                                     });
//                                   });
//                                 });
//                               },
//                             ),
//                           )),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: 20),
//                 Flexible(
//                     flex: 1,
//                     child: LabelKu(label: 'PIC Site', content: txtPicSite)),
//                 SizedBox(width: 20),
//                 Flexible(
//                     flex: 1,
//                     child:
//                         LabelKu(label: 'PIC Department', content: txtPicDept)),
//                 SizedBox(width: 20),
//                 Flexible(
//                     flex: 1,
//                     child: LabelKu(label: 'PIC Position', content: txtPicPos))
//               ]),
//               SizedBox(height: 10),
//               Flexible(
//                   flex: 2,
//                   child: TextBox(controller: txtSubject, label: 'Subject')),
//               SizedBox(height: 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         EasyLoading.show(
//                             status: 'Loading',
//                             maskType: EasyLoadingMaskType.black);
//                         TicketModel.putTicket(
//                                 widget.ticketID,
//                                 picSelectedValue.toString(),
//                                 txtSubject.text,
//                                 valPriority.toString(),
//                                 tsSelectedValue.toString(),
//                                 widget.tsID)
//                             .then((value) {
//                           if (value == 'success') {
//                             EasyLoading.dismiss();
//                             Alert(
//                                 context: context,
//                                 title: 'Oke!',
//                                 desc: 'Ticket berhasil disimpan.',
//                                 type: AlertType.success,
//                                 buttons: [
//                                   DialogButton(
//                                       color: Color.fromRGBO(80, 110, 228, 1),
//                                       child: Text('OK',
//                                           style:
//                                               TextStyle(color: Colors.white)),
//                                       onPressed: () {
//                                         setState(() {
//                                           Navigator.pop(context);
//                                           Navigator.pop(context);
//                                         });
//                                       })
//                                 ]).show();
//                           } else {
//                             EasyLoading.dismiss();
//                             Alert(
//                                 context: context,
//                                 title: 'Opss!',
//                                 desc: 'Ticket gagal tersimpan :(',
//                                 type: AlertType.error,
//                                 buttons: [
//                                   DialogButton(
//                                       color: Color.fromRGBO(80, 110, 228, 1),
//                                       child: Text('OK',
//                                           style:
//                                               TextStyle(color: Colors.white)),
//                                       onPressed: () {
//                                         setState(() {
//                                           Navigator.pop(context);
//                                           Navigator.pop(context);
//                                         });
//                                       })
//                                 ]).show();
//                           }
//                         });
//                       },
//                       child: Button(label: 'Update', color: Colors.green)),
//                   SizedBox(width: 10),
//                   GestureDetector(
//                       onTap: () {
//                         EasyLoading.show(
//                             status: 'Loading',
//                             maskType: EasyLoadingMaskType.black);
//                         TicketModel.deleteTicket(widget.ticketID).then((value) {
//                           if (value == 'success') {
//                             EasyLoading.dismiss();
//                             Alert(
//                                 context: context,
//                                 title: 'Oke!',
//                                 desc: 'Ticket berhasil dihapus.',
//                                 type: AlertType.success,
//                                 buttons: [
//                                   DialogButton(
//                                       color: Color.fromRGBO(80, 110, 228, 1),
//                                       child: Text('OK',
//                                           style:
//                                               TextStyle(color: Colors.white)),
//                                       onPressed: () {
//                                         setState(() {
//                                           Navigator.pop(context);
//                                           Navigator.pop(context);
//                                         });
//                                       })
//                                 ]).show();
//                           } else {
//                             EasyLoading.dismiss();
//                             Alert(
//                                 context: context,
//                                 title: 'Opss!',
//                                 desc: 'Ticket gagal terhapus :(',
//                                 type: AlertType.error,
//                                 buttons: [
//                                   DialogButton(
//                                       color: Color.fromRGBO(80, 110, 228, 1),
//                                       child: Text('OK',
//                                           style:
//                                               TextStyle(color: Colors.white)),
//                                       onPressed: () {
//                                         setState(() {
//                                           Navigator.pop(context);
//                                           Navigator.pop(context);
//                                         });
//                                       })
//                                 ]).show();
//                           }
//                         });
//                       },
//                       child: Button(label: 'Delete', color: Colors.red))
//                 ],
//               )
//             ],
//           );
//   }

//   Row radioButtonKu(Priority value, label) {
//     return Row(
//       children: [
//         Radio(
//             activeColor: Color.fromRGBO(80, 110, 228, 1),
//             value: value,
//             groupValue: priority,
//             onChanged: (Priority? value) {
//               setState(() {
//                 priority = value;
//                 if (priority.toString() == 'low') {
//                   valPriority = 0;
//                 } else if (priority.toString() == 'medium') {
//                   valPriority = 1;
//                 } else {
//                   valPriority = 2;
//                 }
//               });
//             }),
//         Text(label)
//       ],
//     );
//   }
// }

// class LabelKu extends StatelessWidget {
//   const LabelKu({Key? key, required this.label, required this.content})
//       : super(key: key);

//   final label, content;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label,
//             style: TextStyle(
//                 color: Color.fromRGBO(101, 109, 154, 1),
//                 fontFamily: 'Poppins',
//                 fontSize: 13)),
//         SizedBox(height: 5),
//         Container(
//           height: 40,
//           decoration: BoxDecoration(
//               border: Border.all(color: Color.fromRGBO(158, 158, 158, 1)),
//               borderRadius: BorderRadius.circular(3.5)),
//           child: Center(
//             child: Text(content,
//                 style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class TextBox extends StatelessWidget {
//   const TextBox({Key? key, required this.controller, required this.label})
//       : super(key: key);

//   final controller, label;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label,
//             style: TextStyle(
//                 color: Color.fromRGBO(101, 109, 154, 1),
//                 fontFamily: 'Poppins',
//                 fontSize: 13)),
//         SizedBox(height: 5),
//         SizedBox(
//           height: 150,
//           child: TextField(
//               controller: controller,
//               maxLines: 100,
//               style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
//               decoration: InputDecoration(
//                   contentPadding: EdgeInsets.all(10),
//                   border: OutlineInputBorder())),
//         ),
//       ],
//     );
//   }
// }

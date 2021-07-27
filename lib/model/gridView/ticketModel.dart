import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schedule_task/_GlobalScript.dart' as gScript;

class TicketModel {
  List<dynamic>? listTicketData;
  String? picID, subject, priority, tsID, useredited;

  TicketModel(
      {this.listTicketData,
      this.picID,
      this.subject,
      this.priority,
      this.tsID,
      this.useredited});

  static Future getTicket(tsID) async {
    var url;
    if (tsID != null) {
      url = gScript.apiLink + '/Tickets?technicalsupport_id=$tsID';
    } else {
      url = gScript.apiLink + '/Tickets';
    }
    print(url);
    var result = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Basic MHAzbkMwbm4zY3QhMG46YzB1bnQzcjR0dDRjaw==',
      'API-KEYS':
          '\$2y\$10\$EaoautcFP3mNIZ/Kg5OIMurSdS9dgsqNQ0vTrYGe83CCikxhLGuOi'
    });

    if (result.statusCode == 200) {
      return TicketModel(listTicketData: jsonDecode(result.body)['data']);
    } else {
      return TicketModel(listTicketData: null);
    }
  }

  static Future postTicket(picID, subject, priority, tsID, useredited) async {
    var url = gScript.apiLink + '/Tickets';

    var result = await http.post(Uri.parse(url), headers: {
      'Authorization': 'Basic MHAzbkMwbm4zY3QhMG46YzB1bnQzcjR0dDRjaw==',
      'API-KEYS':
          '\$2y\$10\$EaoautcFP3mNIZ/Kg5OIMurSdS9dgsqNQ0vTrYGe83CCikxhLGuOi'
    }, body: {
      'pic_id': picID,
      'subject': subject,
      'priority': priority,
      'technicalsupport_id': tsID,
      'useredited': useredited
    });

    return TicketModel(
        picID: jsonDecode(result.body)['pic_id'],
        subject: jsonDecode(result.body)['subject'],
        priority: jsonDecode(result.body)['priority'],
        tsID: jsonDecode(result.body)['technicalsupport_id'],
        useredited: jsonDecode(result.body)['useredited']);
  }
}

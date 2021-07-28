import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schedule_task/_GlobalScript.dart' as gScript;

class TicketModel {
  List<dynamic>? listTicketData;
  String? ticketID,
      picID,
      subject,
      priority,
      status,
      tsID,
      feedback,
      useredited;

  TicketModel(
      {this.ticketID,
      this.listTicketData,
      this.picID,
      this.subject,
      this.priority,
      this.status,
      this.tsID,
      this.feedback,
      this.useredited});

  static Future getTicket(tsID) async {
    var url;
    if (tsID != null) {
      url = gScript.apiLink + '/Tickets?technicalsupport_id=$tsID';
    } else {
      url = gScript.apiLink + '/Tickets';
    }

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

    if (result.statusCode == 201) {
      return 'success';
    } else {
      return 'failed';
    }

    // return TicketModel(
    //     picID: jsonDecode(result.body)['pic_id'],
    //     subject: jsonDecode(result.body)['subject'],
    //     priority: jsonDecode(result.body)['priority'],
    //     tsID: jsonDecode(result.body)['technicalsupport_id'],
    //     useredited: jsonDecode(result.body)['useredited']);
  }

  static Future putTicket(ticketID, status, feedback) async {
    var url = gScript.apiLink + '/Tickets';

    var result = await http.put(Uri.parse(url), headers: {
      'Authorization': 'Basic MHAzbkMwbm4zY3QhMG46YzB1bnQzcjR0dDRjaw==',
      'API-KEYS':
          '\$2y\$10\$EaoautcFP3mNIZ/Kg5OIMurSdS9dgsqNQ0vTrYGe83CCikxhLGuOi'
    }, body: {
      'ticket_id': ticketID,
      'status': status,
      'feedback': feedback
    });

    if (result.statusCode == 201) {
      return 'success';
    } else {
      return 'failed';
    }
  }
}

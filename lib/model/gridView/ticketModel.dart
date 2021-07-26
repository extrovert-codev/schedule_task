import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schedule_task/_GlobalScript.dart' as gScript;

class TicketModel {
  final List<dynamic>? listTicketData;

  TicketModel({this.listTicketData});

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
      throw Exception('Failed to load Ticket');
    }
  }

  static Future postTicket() async {
    var url = gScript.apiLink + '/Tickets';

    var result = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Basic MHAzbkMwbm4zY3QhMG46YzB1bnQzcjR0dDRjaw==',
      'API-KEYS':
          '\$2y\$10\$EaoautcFP3mNIZ/Kg5OIMurSdS9dgsqNQ0vTrYGe83CCikxhLGuOi'
    });

    if (result.statusCode == 200) {
      return TicketModel(listTicketData: jsonDecode(result.body)['data']);
    } else {
      throw Exception('Failed to load Ticket');
    }
  }
}

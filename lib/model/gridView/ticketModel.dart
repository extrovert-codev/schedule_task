import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schedule_task/_GlobalScript.dart' as gScript;

class TicketModel {
  static Future<List<dynamic>> getTicket(tsID) async {
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
      var jsonObject = jsonDecode(result.body)['data'];

      List<dynamic> listTicketData = [];
      for (int i = 0; i < jsonObject.length; i++) {
        listTicketData.add(jsonObject[i]);
      }

      return listTicketData;
    } else {
      throw Exception('Failed to load Ticket');
    }
  }
}

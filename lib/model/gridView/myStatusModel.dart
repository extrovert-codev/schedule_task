import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schedule_task/_GlobalScript.dart' as gScript;

class MyStatusModel {
  final dynamic alltickets, waitinglist, ongoing, finish;

  MyStatusModel({this.alltickets, this.waitinglist, this.ongoing, this.finish});

  static Future getMyStatus(tsID) async {
    var url = gScript.apiLink + '/MyStatus?technicalsupport_id=$tsID';
 
    var result = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Basic MHAzbkMwbm4zY3QhMG46YzB1bnQzcjR0dDRjaw==',
      'API-KEYS':
          '\$2y\$10\$EaoautcFP3mNIZ/Kg5OIMurSdS9dgsqNQ0vTrYGe83CCikxhLGuOi'
    });

    if (result.statusCode == 200) {
          print(jsonDecode(result.body));
          print(jsonDecode(result.body)['data']);
          print(jsonDecode(result.body)['data'][0]['alltickets']);
      return MyStatusModel(
          alltickets: jsonDecode(result.body)['alltickets'],
          waitinglist: jsonDecode(result.body)['waitinglist'],
          ongoing: jsonDecode(result.body)['ongoing'],
          finish: jsonDecode(result.body)['finish']);
    } else {
      throw Exception('Failed to load My Status');
    }
  }
}

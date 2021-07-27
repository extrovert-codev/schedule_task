import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schedule_task/_GlobalScript.dart' as gScript;

class MyStatusModel {
  List<dynamic>? listMyStatusData;

  MyStatusModel({this.listMyStatusData});

  static Future getMyStatus(tsID) async {
    var url = gScript.apiLink + '/MyStatus?technicalsupport_id=$tsID';

    var result = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Basic MHAzbkMwbm4zY3QhMG46YzB1bnQzcjR0dDRjaw==',
      'API-KEYS':
          '\$2y\$10\$EaoautcFP3mNIZ/Kg5OIMurSdS9dgsqNQ0vTrYGe83CCikxhLGuOi'
    });

    if (result.statusCode == 200) {
      return MyStatusModel(listMyStatusData: jsonDecode(result.body)['data']);
    } else {
      return null;
    }
  }
}

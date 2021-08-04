import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schedule_task/_GlobalScript.dart' as gScript;

class PICModel {
  List<dynamic>? listPICData;

  PICModel({this.listPICData});

  static Future getPIC(nik) async {
    var url = gScript.apiLink + '/Employee?nik=$nik';

    var result = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Basic MHAzbkMwbm4zY3QhMG46YzB1bnQzcjR0dDRjaw==',
      'API-KEYS':
          '\$2y\$10\$EaoautcFP3mNIZ/Kg5OIMurSdS9dgsqNQ0vTrYGe83CCikxhLGuOi'
    });

    if (result.statusCode == 200) {
      return PICModel(listPICData: jsonDecode(result.body)['data']);
    } else {
      return PICModel(listPICData: null);
    }
  }
}

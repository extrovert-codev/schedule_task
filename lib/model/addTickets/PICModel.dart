import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schedule_task/_GlobalScript.dart' as gScript;

class PICModel {
  static Future<List<dynamic>> getPIC() async {
    var url =  gScript.apiLink + '/Employee';
    var result = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Basic MHAzbkMwbm4zY3QhMG46YzB1bnQzcjR0dDRjaw==',
      'API-KEYS':
          '\$2y\$10\$EaoautcFP3mNIZ/Kg5OIMurSdS9dgsqNQ0vTrYGe83CCikxhLGuOi'
    });

    if (result.statusCode == 200) {
      var jsonObject = jsonDecode(result.body)['data'];

      List<dynamic> listPICData = [];
      for (int i = 0; i < jsonObject.length; i++) {
        listPICData.add(jsonObject[i]);
      }

      return listPICData;
    } else {
      throw Exception('Failed to load PIC');
    }
  }
}

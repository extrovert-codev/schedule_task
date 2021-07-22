import 'dart:convert';
import 'package:http/http.dart' as http;

class PICModel {
  var employeeID, name, site, dept, pos;

  PICModel({this.employeeID, this.name, this.site, this.dept, this.pos});

  factory PICModel.getPIC(Map<String, dynamic> object) {
    return PICModel(
        employeeID: object['employee_id'],
        name: object['name'],
        site: object['site'],
        dept: object['department'],
        pos: object['position']);
  }

  static Future<List<PICModel>> execAPI() async {
    var client = http.Client();
    try {
      var url = 'http://localhost/rest-api/schedule-task-api/api/Employee';
      var result = await client.get(Uri.parse(url), headers: {
        'Authorization': 'Basic MHAzbkMwbm4zY3QhMG46YzB1bnQzcjR0dDRjaw==',
        'API-KEYS':
            '\$2y\$10\$EaoautcFP3mNIZ/Kg5OIMurSdS9dgsqNQ0vTrYGe83CCikxhLGuOi'
      });

      if (result.statusCode == 200) {
        var jsonObject = jsonDecode(result.body);

        List<dynamic> listPICData =
            (jsonObject as Map<String, dynamic>)['data'];
        List<PICModel> pic = [];
        for (int i = 0; i < listPICData.length; i++) {
          pic.add(PICModel.getPIC(listPICData[i]));
        }

        return pic;
      } else {
        throw Exception('Failed to load PIC');
      }
    } finally {
      client.close();
    }
  }
}

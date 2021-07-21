import 'dart:convert';
import 'package:http/http.dart' as http;

class PICModel {
  var employeeID, name, siteID, deptID, posID;

  PICModel({this.employeeID, this.name, this.siteID, this.deptID, this.posID});

  factory PICModel.getPIC(Map<String, dynamic> object) {
    return PICModel(
        employeeID: object['employee_id'],
        name: object['name'],
        siteID: object['site_id'],
        deptID: object['department_id'],
        posID: object['position_id']);
  }

  static Future<List<PICModel>> execAPI() async {
    var client = http.Client();
    try {
      var url =
          'http://192.168.5.99:8080/rest-api/hrms-rest-server/api/addticketsemployee';
      var result = await client.get(Uri.parse(url), headers: {
        'Authorization': 'Basic MHAzbkMwbm4zY3QhMG46YzB1bnQzcjR0dDRjaw==',
        'API-KEYS':
            '\$2y\$10\$EaoautcFP3mNIZ/Kg5OIMurSdS9dgsqNQ0vTrYGe83CCikxhLGuOi',
        'Access-Control-Allow-Origin': '*'
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

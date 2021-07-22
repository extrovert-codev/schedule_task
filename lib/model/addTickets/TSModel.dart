import 'dart:convert';
import 'package:http/http.dart' as http;

class TSModel {
  var employeeID, name, siteID, deptID, posID;

  TSModel({this.employeeID, this.name, this.siteID, this.deptID, this.posID});

  factory TSModel.getTS(Map<String, dynamic> object) {
    return TSModel(
        employeeID: object['employee_id'],
        name: object['name'],
        siteID: object['site_id'],
        deptID: object['department_id'],
        posID: object['position_id']);
  }

  static Future<List<TSModel>> execAPI() async {
    var client = http.Client();
    try {
      var url =
          'http://192.168.5.99:8080/rest-api/hrms-rest-server/api/addticketsemployee';
      var result = await client.get(Uri.parse(url), headers: {
        'Authorization': 'Basic MHAzbkMwbm4zY3QhMG46YzB1bnQzcjR0dDRjaw==',
        'API-KEYS':
            '\$2y\$10\$EaoautcFP3mNIZ/Kg5OIMurSdS9dgsqNQ0vTrYGe83CCikxhLGuOi'
      });

      if (result.statusCode == 200) {
        var jsonObject = jsonDecode(result.body);

        List<dynamic> listTSData =
            (jsonObject as Map<String, dynamic>)['data'];
        List<TSModel> pic = [];
        for (int i = 0; i < listTSData.length; i++) {
          pic.add(TSModel.getTS(listTSData[i]));
        }

        return pic;
      } else {
        throw Exception('Failed to load TS');
      }
    } finally {
      client.close();
    }
  }
}

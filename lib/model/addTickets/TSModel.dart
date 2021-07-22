import 'dart:convert';
import 'package:http/http.dart' as http;

class TSModel {
  var employeeID, name;

  TSModel({this.employeeID, this.name});

  factory TSModel.getTS(Map<String, dynamic> object) {
    return TSModel(
        employeeID: object['employee_id'],
        name: object['name']);
  }

  static Future<List<TSModel>> execAPI() async {
    var client = http.Client();
    try {
      var url =
          'http://localhost/rest-api/schedule-task-api/api/Employee?isTS=True';
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

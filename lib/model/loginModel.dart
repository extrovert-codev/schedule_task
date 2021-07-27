import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schedule_task/_GlobalScript.dart' as gScript;

class LoginModel {
  List<dynamic>? listLoginData;

  LoginModel({this.listLoginData});

  static Future getLogin(nik) async {
    var url = gScript.apiLink + '/Login?nik=$nik';

    var result = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Basic MHAzbkMwbm4zY3QhMG46YzB1bnQzcjR0dDRjaw==',
      'API-KEYS':
          '\$2y\$10\$EaoautcFP3mNIZ/Kg5OIMurSdS9dgsqNQ0vTrYGe83CCikxhLGuOi'
    });

    if (result.statusCode == 200) {
      return LoginModel(listLoginData: jsonDecode(result.body)['data']);
    } else {
      throw Exception('Failed to login');
    }
  }
}

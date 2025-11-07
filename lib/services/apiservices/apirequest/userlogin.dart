import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:Nectar/services/apiservices/urls/baseurl.dart';
import 'package:Nectar/services/apiservices/urls/endpoints.dart';

class Userlogin {
  Future userlogin(String email, String password) async {
    final getstorage = GetStorage();
    var response = await http.post(
      Uri.parse("${Baseurl().baseurl}${Endpoints().login}"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({"email": email, "password": password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsondata = jsonDecode(response.body);

      // Getstorage token save
      String token = jsondata['data']['token'];
      getstorage.write("token", token);

      String message = jsondata['message'];

      return message;
    } else if (response.statusCode == 401) {
      var jsondata = jsonDecode(response.body);
      String message = jsondata['message'];
      return message;
    } else if (response.statusCode == 422) {
      var jsondata = jsonDecode(response.body);
      String message = jsondata['errors'][0]['message'];
      return message;
    } else {
      String message = "unknownerror";
      return message;
    }
  }
}

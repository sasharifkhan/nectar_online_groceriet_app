import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:Nectar/services/apiservices/urls/baseurl.dart';
import 'package:Nectar/services/apiservices/urls/endpoints.dart';

class Deleteaccount {
  Future deleteaccount(String password) async {
    final getstorage = GetStorage();
    String token = getstorage.read('token');

    var response = await http.post(
      Uri.parse("${Baseurl().baseurl}${Endpoints().deleteaccount}"),
      headers: {"Authorization": "Bearer $token"},
      body: {"password": password},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsondata = jsonDecode(response.body);
      getstorage.remove('token');

      bool success = jsondata['success'];

      return {"success": success};
    } else {
      bool success = false;
      return {"success": success};
    }
  }
}

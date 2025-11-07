import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:Nectar/services/apiservices/urls/baseurl.dart';
import 'package:Nectar/services/apiservices/urls/endpoints.dart';

class Changepassword {
  Future changepassword(String currentPassword, String newPassword) async {
    final getstorage = GetStorage();
    String token = getstorage.read('token');

    var response = await http.post(
      Uri.parse("${Baseurl().baseurl}${Endpoints().changepassword}"),
      headers: {"Authorization": "Bearer $token"},
      body: {"current_password": currentPassword, "new_password": newPassword},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsondata = jsonDecode(response.body);

      bool success = jsondata['success'];
      String message = jsondata['message'];
      return {"success": success, "message": message};
    } else {
      bool success = false;
      return {"success": success};
    }
  }
}

import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:Nectar/services/apiservices/urls/baseurl.dart';
import 'package:Nectar/services/apiservices/urls/endpoints.dart';

class Getuserprofile {
  Future getuserprofile() async {
    final getstorage = GetStorage();
    String token = getstorage.read('token');

    var response = await http.get(
      Uri.parse("${Baseurl().baseurl}${Endpoints().userprofile}"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsondata = jsonDecode(response.body);

      String name = jsondata['data']['user']['name'];
      String email = jsondata['data']['user']['email'];
      String phone = jsondata['data']['user']['phone'];
      bool success = jsondata['success'];

      return {"success": success, "name": name, "email": email, "phone": phone};
    } else {
      bool success = false;
      return {"success": success};
    }
  }
}

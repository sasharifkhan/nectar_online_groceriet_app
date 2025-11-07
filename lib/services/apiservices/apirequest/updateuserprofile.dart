import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:Nectar/services/apiservices/urls/baseurl.dart';
import 'package:Nectar/services/apiservices/urls/endpoints.dart';

class Updateuserprofile {
  Future updateuserprofile(String name, String phone) async {
    final getstorage = GetStorage();
    String token = getstorage.read('token');

    var response = await http.put(
      Uri.parse("${Baseurl().baseurl}${Endpoints().userprofile}"),
      headers: {"Authorization": "Bearer $token"},
      body: {"name": name, "phone": phone},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsondata = jsonDecode(response.body);

      bool success = jsondata['success'];
      return {
        "success":success
      };
    } else {
      bool success = false;
      return {
        "success": success
      };
    }
  }
}

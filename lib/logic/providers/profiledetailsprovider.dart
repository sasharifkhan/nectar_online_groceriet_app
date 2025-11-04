import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Profiledetailsprovider extends ChangeNotifier {

  String _displayname = "Display Name";
  get displayname => _displayname;

  String _email = "email";
  get email => _email;


  getprofileDetails()async{
    String token =  GetStorage().read('token');
    String baseurl = "https://api.zhndev.site/wp-json";
    String path = "/base/api/auth/profile";
    var response = await http.get(Uri.parse("$baseurl$path"),headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });
    if(response.statusCode == 200 || response.statusCode == 201){
      var profiledatalist =  jsonDecode(response.body);
      _displayname = profiledatalist['data']['display_name'];
      _email = profiledatalist['data']['email'];
    }
    notifyListeners();
  }
 
}
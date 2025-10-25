// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class LoginCheck{
   Future<String?> Login(String username, String password) async {

    final token = GetStorage();
    const String baseurl = 'https://foodsflow.netlify.app';
    const String loginpath = '/api/auth/login';

    try{
    var response =  await http.post(Uri.parse('$baseurl$loginpath'),body: {
      "email": username, 
      "password": password
    });

    if(response.statusCode == 200){
      print("Okay");
      var data = jsonDecode(response.body);
      String tokendata =  data['data']['token'];
      token.write('token',tokendata);
      return tokendata;
    } return null;
    
    } catch (e){
      print(e);
      return null;
    }
    
  }
  
}

class RegisterNew{
  Future<String?>  Register(String username,String email, String password) async {
    final token = GetStorage();
    const String baseurl = 'https://foodsflow.netlify.app';
    const String registerpath = '/api/auth/register';
    try {
      var response = await http.post(Uri.parse('$baseurl$registerpath'),body: {
          "name": username,
          "email": email, 
          "password": password 
        });

      if (response.statusCode == 201){
        var data = jsonDecode(response.body);
        String tokendata = data['data']['token'];
        token.write('token', tokendata);
        return tokendata;

      } print(response.statusCode); return null;
      
    } catch (e){
      print(e);
      return null;
    }
  }
}
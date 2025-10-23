// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;


class LoginCheck{
   Future<bool?> Login(String username, String password) async {
    print(username,);
    print(password);
    const String baseurl = 'https://foodsflow.netlify.app';
    const String loginpath = '/api/auth/login';
    try{
    var response =  await http.post(Uri.parse('$baseurl$loginpath'),body: {
      "email": username, 
      "password": password
    });
    print(response.statusCode);
    if(response.statusCode == 200){
      print("Okay");
      return true;
    }
    return false;
    } catch (e){
      print(e);
      return null;
    }
    
  }
  
}

class RegisterNew{
  Future<bool?>  Register(String username,String email, String password) async {
    const String baseurl = 'https://foodsflow.netlify.app';
    const String registerpath = '/api/auth/register';
    try {
    var response = await http.post(Uri.parse('$baseurl$registerpath'),body: {
        "name": username,
        "email": email, 
        "password": password 
       });
    if (response.statusCode == 201){
      print("Create Success");
      // return jsonDecode(response.body);
      return true;
    } print(response.statusCode); return false;
    } catch (e){
      print(e);
      return false;
    }
  }
}
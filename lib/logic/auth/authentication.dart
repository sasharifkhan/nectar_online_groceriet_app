// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class LoginCheck{
   Future<String?> Login(String username, String password) async {

    final token = GetStorage();
    const String baseurl = 'https://demo.zhndev.site/wp/wp-json';
    const String loginpath = '/base/api/auth/login';

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
  Future<String?>  Register(String firstname, String lastname, String username,String email, String password) async {
    final token = GetStorage();
    const String baseurl = 'https://demo.zhndev.site/wp/wp-json';
    const String registerpath = '/base/api/auth/register';
    try {
      var response = await http.post(Uri.parse('$baseurl$registerpath'),body: {
        "username": username,
        "email": email,
        "password": password,
        "first_name": firstname,
        "last_name": lastname
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

class ForgetPassword{
  Forgetpassword(String email) async{
    final String baseurl = 'https://demo.zhndev.site/wp/wp-json';
    final String path = '/base/api/auth/forgot-password';
    var response = await http.post(Uri.parse('$baseurl$path'),body: 
      {
        "email": email
      } 
    );
    return response.statusCode;
    // if (response.statusCode == 200) {
    //   print(response.body);
    // }
  }
}


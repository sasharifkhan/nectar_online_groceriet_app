
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class LoginCheck{
   Future<String?> login(String username, String password) async {

    final token = GetStorage();
    const String baseurl = 'https://api.zhndev.site/wp-json';
    const String loginpath = '/base/api/auth/login';

    try{
    var response =  await http.post(Uri.parse('$baseurl$loginpath'),body: 
      {
        "username": username,
        "password": password
      }
    );

    if(response.statusCode == 200 || response.statusCode == 201){
      var data = jsonDecode(response.body);
      String tokendata =  data['data']['token'];
      token.write('token',tokendata);
      String message = data['message'];
      return message;
    } else{
      var data = jsonDecode(response.body);
      String message = data['message'];
      return message;
    }
    
    } catch (e){
      return null;
    }
    
  }

}

class RegisterNew{
  Future<String?>  register(String firstname,  String username,String email, String password) async {
    final token = GetStorage();
    const String baseurl = 'https://api.zhndev.site/wp-json';
    const String registerpath = '/base/api/auth/register';
    try {
      var response = await http.post(Uri.parse('$baseurl$registerpath'),body: {
        "username": username,
        "email": email,
        "password": password,
        "first_name": firstname,
        });

      if (response.statusCode == 201 || response.statusCode == 200){
        var data = jsonDecode(response.body);
        String tokendata = data['data']['token'];
        token.write('token', tokendata);
        String message = data['message'];
        return message;

      } else if (response.statusCode == 400){
        var data = jsonDecode(response.body);
        String message = data['message'];
        return message;

      } else {
        String message = 'Server Error';
        return message;
      }

    } catch (e){
      return null;
    }
  }
}

class ForgetPassword{
  forgetpassword(String email) async{
    final String baseurl = 'https://api.zhndev.site/wp-json';
    final String path = '/base/api/auth/forgot-password';
    var response = await http.post(Uri.parse('$baseurl$path'),body: 
      {
        "email": email
      } 
    );
    return response.statusCode;
  }
}


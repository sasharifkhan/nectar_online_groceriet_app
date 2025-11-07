
import 'package:http/http.dart' as http;

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


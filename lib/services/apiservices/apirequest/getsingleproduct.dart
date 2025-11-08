import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Nectar/services/apiservices/urls/baseurl.dart';
import 'package:Nectar/services/apiservices/urls/endpoints.dart';

class Getsingleproduct {
  Future<Map<String,dynamic>> getsingleproduct(int id) async {

    var response = await http.get(
      Uri.parse("${Baseurl().baseurl}${Endpoints().products}/$id"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsondata = jsonDecode(response.body);
      bool status = true;
      String image = jsondata['data']['product']['image'];
      String name = jsondata['data']['product']['name'];
      String stockstatus = jsondata['data']['product']['stock_status'];
      String price = jsondata['data']['product']['price'];
      String description = jsondata['data']['product']['description'];
      String rating = jsondata['data']['product']['rating'];
      String type = jsondata['data']['product']['type'];

      return{
        "status" : status,
        "image":image,
        "name": name,
        "stockstatus" : stockstatus,
        "price": price,
        "description": description,
        "rating": rating,
        "type": type
      };

     
    } else {
      bool status = false;
      return {"status" : status};
    }
  }
}

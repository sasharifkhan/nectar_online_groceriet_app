import 'dart:convert';
import 'package:Nectar/services/models/allproductmodel.dart';
import 'package:http/http.dart' as http;
import 'package:Nectar/services/apiservices/urls/baseurl.dart';
import 'package:Nectar/services/apiservices/urls/endpoints.dart';

class Getallproduct {
  Future<List<Allproductmodel>?> getallproduct() async {
    var response = await http.get(
      Uri.parse("${Baseurl().baseurl}${Endpoints().products}"),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsondata = jsonDecode(response.body);
      final productlist = jsondata['data']['products'] as List;

      return productlist.map((e) => Allproductmodel.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}

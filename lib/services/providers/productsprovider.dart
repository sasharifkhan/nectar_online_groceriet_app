import 'package:Nectar/services/models/allproductmodel.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Nectar/services/apiservices/urls/baseurl.dart';
import 'package:Nectar/services/apiservices/urls/endpoints.dart';

class Productsprovider extends ChangeNotifier {
  List<Allproductmodel> _allproducts = [];
  get allproducts => _allproducts;

   Future<void> getallproduct() async {
    var response = await http.get(
      Uri.parse("${Baseurl().baseurl}${Endpoints().products}"),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsondata = jsonDecode(response.body);
      final productlist = jsondata['data']['products'] as List;

      _allproducts = productlist
          .map((e) => Allproductmodel.fromJson(e))
          .toList();
    } else {
      
    }
    notifyListeners();
  }
}

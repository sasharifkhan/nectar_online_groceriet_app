import 'dart:convert';
import 'package:Nectar/logic/models/products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getproductsprovider extends ChangeNotifier {
  List<ProductsModel> _products = [];

  get products => _products;
  bool _isLoading = false;
  get isloading => _isLoading;

  Future<List<ProductsModel>?> getproducts() async {
    _isLoading = true;
    var response = await http.get(
      Uri.parse("https://api.zhndev.site/wp-json/base/api/products"),
    );
    _isLoading = false;
    if (response.statusCode == 200 || response.statusCode == 201) ;
    final jsondata = jsonDecode(response.body);
    var jsondecodeddata = jsondata['data']['products'] as List;
    _products = jsondecodeddata.map((e) =>ProductsModel.fromJson(e)).toList();
    notifyListeners();
    return null;
  }
}

import 'dart:convert';
import 'package:Nectar/logic/models/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getproductcategoresprovider extends ChangeNotifier {
  List<Categoriesmodel> _productcategories = [];

  get productcategories => _productcategories;
  bool _isLoading = false;
  get isloading => _isLoading;

  Future<List<Categoriesmodel>?> getproductcategories() async {
    _isLoading = true;
    var response = await http.get(
      Uri.parse("https://api.zhndev.site/wp-json/base/api/categories"),
    );
    _isLoading = false;
    if (response.statusCode == 200 || response.statusCode == 201) ;
    final jsondata = jsonDecode(response.body);
    var jsondecodeddata = jsondata['data']['categories'] as List;
    _productcategories = jsondecodeddata.map((e) =>Categoriesmodel.fromJson(e)).toList();
    notifyListeners();
    return null;
  }
}

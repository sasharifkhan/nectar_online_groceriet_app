import 'dart:convert';

import 'package:Nectar/services/apiservices/urls/baseurl.dart';
import 'package:Nectar/services/apiservices/urls/endpoints.dart';
import 'package:Nectar/services/models/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Categoriesprovider extends ChangeNotifier {

  bool _isloading = false;
  get isloading => _isloading;

  List<Categoriesmodel> _productcategories = [];
  get productcategories=> _productcategories;
  
  categories() async{
    _isloading = true;
    var response = await http.get(Uri.parse("${Baseurl().baseurl}${Endpoints().categories}"));
    if (response.statusCode == 200 || response.statusCode == 201){
      final jsondata = jsonDecode(response.body);
      final categorisdata = jsondata['data']['categories'] as List;
      _productcategories = categorisdata.map((e) => Categoriesmodel.fromJson(e)).toList();
    }
    _isloading = false;
    notifyListeners();
  }
}
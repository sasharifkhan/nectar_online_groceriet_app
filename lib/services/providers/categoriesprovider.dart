import 'package:Nectar/services/models/categoriesmodel.dart';
import 'package:flutter/material.dart';

class Categoriesprovider extends ChangeNotifier {

  bool _isloading = false;
  get isloading => _isloading;

  List<Categoriesmodel> _productcategories = [];
  get productcategories=> _productcategories;
  
  categories(){

  }
}
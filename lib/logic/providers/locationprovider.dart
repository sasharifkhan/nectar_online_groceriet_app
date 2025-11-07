import 'package:Nectar/services/location_services/getcurrentlocation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Locationprovider extends ChangeNotifier {

  String _locationdetails = "Unknown Location";
  get locationdetails => _locationdetails;

  void setlicationfromgetstorate(){
  final locationold = GetStorage().read('location');
    if (locationold !=null){
      _locationdetails = locationold;
    }
  }

  getloctionfromdevice()async {
    final getstorage =  GetStorage();
    final location = await LocationService.getCurrentLocation();
    String locationplace = '${location['place']}';
    getstorage.write('location', locationplace);
    _locationdetails = locationplace;
    notifyListeners();


  }
}
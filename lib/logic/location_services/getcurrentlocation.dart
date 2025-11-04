import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  static Future<Map<String, dynamic>> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // throw Exception("Location permission denied.");
        return {"place": "Unknown"};
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // throw Exception("Location permission permanently denied.");
      return {"place": "Unknown"};
    }

    final pos = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );

    String placeName = "Unknown";

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(pos.latitude, pos.longitude);

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        placeName = "${place.locality ?? ''}, ${place.country ?? ''}".trim();
      }
    } catch (e) {
      placeName = "Unknown Location";
    }

    return {
      "latitude": pos.latitude,
      "longitude": pos.longitude,
      "place": placeName,
    };
  }
}

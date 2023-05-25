import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices with ChangeNotifier {
  late String _address;

  String get address {
    return _address;
  }

  getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    _address = placemarks[0].name! + " " + placemarks[1].street!;
    notifyListeners();
    log(_address);
  }

  getCurrentUserLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      final requestPermission = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      getAddress(currentPosition.latitude, currentPosition.longitude);
    }
  }
}

// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as locationPub;

Future<bool> checkLocationServicePermission() async {
  // Add your function code here!
  bool locationPermission = await checkLocationPermission();
  bool locationService = await checkLocationService();
  bool locationService2 = await checkLocationService();

  print('locationPermission topup list : ${locationPermission}');
  print('locationService topup list : ${locationService}');
  if (locationPermission && locationService) {
    LatLng currentLocation = await getCurrentLocation();
    print('currentLocation in tap topup card');
    print(currentLocation);

    if (currentLocation == null ||
        currentLocation == LatLng(0.0, 0.0) ||
        currentLocation == LatLng(0, 0)) {
      await openAppSettings();
      return false;
    }
    return true;
  } else {
    await openAppSettings();
    return false;
  }
}

Future<bool> checkLocationService() async {
  // Add your function code here!
  locationPub.Location location = new locationPub.Location();

  bool _serviceEnabled;
  // PermissionStatus _permissionGranted;
  // LocationData _locationData;
  print('serviceee');
  _serviceEnabled = await location.serviceEnabled();
  print('serviceee');
  if (!_serviceEnabled) {
    print('serviceee');
    _serviceEnabled = await location.requestService();
    print('serviceee');
    if (!_serviceEnabled) {
      return false;
    }
  }
  return true;
}

Future<LatLng> getCurrentLocation() async {
  print('getCurrentLocation()');
  locationPub.Location location = locationPub.Location();
  print('getCurrentLocation()');
  try {
    print('getCurrentLocation()');
    locationPub.LocationData currentLocation = await location.getLocation();
    print(
        "Current Location: ${currentLocation.latitude}, ${currentLocation.longitude}");
    print(LatLng(currentLocation.latitude!, currentLocation.longitude!));
    return LatLng(currentLocation.latitude!, currentLocation.longitude!);
  } catch (e) {
    print("Error getting location: $e");
    return LatLng(0.0, 0.0);
  }
}

Future<bool> checkLocationPermission() async {
  locationPub.Location location = new locationPub.Location();

  locationPub.PermissionStatus _permissionGranted;
  locationPub.LocationData _locationData;

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == locationPub.PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != locationPub.PermissionStatus.granted) {
      if (_permissionGranted == locationPub.PermissionStatus.deniedForever) {
        if (_permissionGranted == locationPub.PermissionStatus.granted) {
          return true;
        }
      }

      return false;
    }
  }
  return true;
}

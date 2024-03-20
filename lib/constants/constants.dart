import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

export 'colors.dart';
export 'strings.dart';
export 'themes.dart';
export 'space_padding.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 
  return await Geolocator.getCurrentPosition();
}


Widget getWeatherIcon(int code) {
		switch (code) {
		  case >= 200 && < 300 :
		    return Image.asset(
					'assets/1.png'
				);
			case >= 300 && < 400 :
		    return Image.asset(
					'assets/2.png'
				);
			case >= 500 && < 600 :
		    return Image.asset(
					'assets/3.png'
				);
			case >= 600 && < 700 :
		    return Image.asset(
					'assets/4.png'
				);
			case >= 700 && < 800 :
		    return Image.asset(
					'assets/5.png'
				);
			case == 800 :
		    return Image.asset(
					'assets/6.png'
				);
			case > 800 && <= 804 :
		    return Image.asset(
					'assets/7.png'
				);
		  default:
			return Image.asset(
				'assets/7.png'
			);
		}
	}

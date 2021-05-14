import 'dart:io';

import 'package:clima_app_flutter/screens/location_screen.dart';
import 'package:clima_app_flutter/services/weather.dart';
import 'package:clima_app_flutter/utilities/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:global_configuration/global_configuration.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    await GlobalConfiguration().loadFromPath("config/app_settings.json");
    try {
      var weatherData = await WeatherModel().getLocationWeather();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData);
      }));
    } on SocketException {
      CustomAlert().showWeatherAlert(
          context, 'Check your internet connection and try again.');
    } catch (errorMessage) {
      CustomAlert().showWeatherAlert(context, errorMessage.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

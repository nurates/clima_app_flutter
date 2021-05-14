import 'package:clima_app_flutter/services/weather.dart';
import 'package:clima_app_flutter/utilities/constants.dart';
import 'package:clima_app_flutter/utilities/custom_alert.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  WeatherModel weather = WeatherModel();
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.teal,
              ]),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () async {
                  try {
                    if (cityName?.trim()?.isNotEmpty ?? false) {
                      var weatherData = await weather.getCityWeather(cityName);
                      Navigator.pop(context, weatherData);
                    } else {
                      CustomAlert().showCityAlert(
                        context,
                        'Wrong City Name',
                      );
                    }
                  } catch (errorMessage) {
                    CustomAlert()
                        .showCityAlert(context, errorMessage.toString());
                  }
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

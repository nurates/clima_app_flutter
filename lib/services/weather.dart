import 'package:clima_app_flutter/services/location.dart';
import 'package:clima_app_flutter/services/networking.dart';
import 'package:global_configuration/global_configuration.dart';

String apiKey = GlobalConfiguration().get('apiKey');
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  NetworkHelper networkHelper;

  Future<dynamic> getCityWeather(String cityName) async {
    Uri uri =
        Uri.parse('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    networkHelper = NetworkHelper(uri);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = await getLocation();
    Uri uri = Uri.parse(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    networkHelper = NetworkHelper(uri);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<Location> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    return location;
  }
}

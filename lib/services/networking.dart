import 'dart:convert';

import 'package:clima_app_flutter/exceptions/network_exception.dart';
import 'package:http/http.dart';

class NetworkHelper {
  final Uri uri;

  NetworkHelper(this.uri);

  Future getData() async {
    Response response = await get(uri);
    String data = response.body;
    int statusCode = response.statusCode;
    var decodedBody = jsonDecode(data);
    var body = statusCode == 200
        ? decodedBody
        : throw NetworkException(decodedBody['message']);
    return body;
  }
}

import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  final Uri uri;

  NetworkHelper(this.uri);

  Future getData() async {
    Response response = await get(uri);
    String data = response.body;
    int statusCode = response.statusCode;
    var decodedBody = jsonDecode(data);
    if (statusCode == 200) {
      return decodedBody;
    }
  }
}

class NetworkException implements Exception {
  final _message;

  NetworkException(this._message);

  String toString() {
    return "$_message";
  }
}

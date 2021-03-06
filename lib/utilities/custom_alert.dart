import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CustomAlert {
  void showCityAlert(BuildContext context, String message) {
    Alert(
        context: context,
        style: AlertStyle(
          backgroundColor: Colors.white,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        title: 'Error',
        desc: message,
        buttons: [
          DialogButton(
            child: Text(
              'OK',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => {Navigator.pop(context)},
            color: Colors.purple,
          ),
        ]).show();
  }

  void showWeatherAlert(BuildContext context, String message) {
    Alert(
        context: context,
        style: AlertStyle(
          backgroundColor: Colors.white,
          isOverlayTapDismiss: false,
          isCloseButton: false,
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        title: 'Error',
        desc: message,
        buttons: [
          DialogButton(
            child: Text(
              "EXIT",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => exit(0),
            color: Colors.purple,
          ),
        ]).show();
  }
}

import 'package:bytebank_persistencia/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.green[900],
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.green[900]),
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.green[900],
              textTheme: ButtonTextTheme.primary,
            )),
        home: Dashboard());
  }
}

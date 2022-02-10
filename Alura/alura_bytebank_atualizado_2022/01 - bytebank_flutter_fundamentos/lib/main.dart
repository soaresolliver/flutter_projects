import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.green[900],
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue))),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.green,
            )
                .copyWith(
                  secondary: Colors.blueAccent[700],
                )
                .copyWith(secondary: Colors.blueAccent[700])),
        home: ListaTransferencias());
  }
}

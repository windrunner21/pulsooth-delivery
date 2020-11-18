import 'package:flutter/material.dart';
import 'package:pulsooth_courier/ui/login-page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulsooth Couriers',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.exo2TextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: LoginPage(),
    );
  }
}

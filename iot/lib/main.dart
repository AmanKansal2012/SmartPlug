import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot/landing_page.dart';
import 'package:iot/utils.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:kBlack,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'connect.io',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         scaffoldBackgroundColor: kBlack,
        // primarySwatch: Colors.black,
      ),

      home: LandingPage(),
    );
  }
}


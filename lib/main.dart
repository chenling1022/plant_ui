import 'package:flutter/material.dart';
import 'package:plant_ui_522/auth_servcie.dart';
import 'package:plant_ui_522/locator.dart';
import 'package:plant_ui_522/rootPage.dart';

void main() {
  setup(); // set up the services
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootPage(auth: new AuthenticationServices()),
    );
  }
}

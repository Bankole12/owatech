import 'package:flutter/material.dart';
import 'package:owatech_test/dependency_injection.dart';
import 'package:owatech_test/view/home_page.dart';

void main() {
  Injector.configure(Flavor.MOCK);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Lato'
      ),
      home: HomePage(),
    );
  }
}
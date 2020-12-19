import 'package:estados/pages/first_page.dart';
import 'package:estados/pages/second_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'first',
      routes: {
        'first': (_) => FirstPage(),
        'second': (_) => SecondPage(),
      },
    );
  }
}
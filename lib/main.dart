import 'package:estados/pages/first_page.dart';
import 'package:estados/pages/second_page.dart';
import 'package:estados/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider( create: (_) => UserService(),)
    ],
    child: MyApp()
  )
);
 
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
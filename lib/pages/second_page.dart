import 'package:flutter/material.dart';


class SecondPage extends StatelessWidget {

  static final routeName = 'Second';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Set Name'),
              color: Colors.blue,
              onPressed: (){},
            ),
            MaterialButton(
              child: Text('Chamge Age'),
              color: Colors.blue,
              onPressed: (){},
            ),
            MaterialButton(
              child: Text('Add Profesion'),
              color: Colors.blue,
              onPressed: (){},
            ),
          ],
        ),
     ),
   );
  }
}
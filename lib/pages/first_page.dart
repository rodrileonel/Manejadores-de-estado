import 'package:flutter/material.dart';


class FirstPage extends StatelessWidget {

  static final routeName = 'First';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            Text('General',style: TextStyle(fontSize: 20),),
            Text('Name:'),
            Text('Age:'),
            Divider(),
            Text('Profesions',style: TextStyle(fontSize: 20),),
            Text('Prof1',),
            Text('Prof2',),
            Text('Prof3',),
            Divider(),
          ],
        ),
     ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.next_plan),
       onPressed: () => Navigator.pushNamed(context, 'second'),
     ),
   );
  }
}
import 'package:estados/models/user.dart';
import 'package:estados/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final userService = Provider.of<UserService>(context,listen: false);
    
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
              onPressed: (){
                userService.user = User(name: 'Rodrigo', age: 33, profesions: []);
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              child: Text('Chamge Age'),
              color: Colors.blue,
              onPressed: (){
                if(userService.exists)
                  userService.changeAge(40);
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              child: Text('Add Profesion'),
              color: Colors.blue,
              onPressed: (){
                if(userService.exists)
                  userService.addProfesion('Programador');
                Navigator.pop(context);
              },
            ),
          ],
        ),
     ),
   );
  }
}
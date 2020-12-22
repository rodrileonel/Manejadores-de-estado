import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SecondPage extends StatelessWidget {

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
              onPressed: (){
                // .add añade un nuevo evento al bloc
                BlocProvider.of<UserBloc>(context).add(
                  UserActive(User(name: 'Rodrigo', age: 33,profesions: []))
                );
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              child: Text('Chamge Age'),
              color: Colors.blue,
              onPressed: (){
                BlocProvider.of<UserBloc>(context).add(
                  ChangeAge(40)
                );
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              child: Text('Add Profesion'),
              color: Colors.blue,
              onPressed: (){
                BlocProvider.of<UserBloc>(context).add(
                  AddProfession('Albañil'),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
     ),
   );
  }
}
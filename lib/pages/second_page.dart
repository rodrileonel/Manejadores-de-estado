import 'package:estados/bloc/user/user_cubit.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
              onPressed: (){
                context.read<UserCubit>().generateUser(
                  User(
                    name: 'Rodrigo',
                    age: 33,
                    profesions: ['Programador','Diseñador'])
                );
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              child: Text('Chamge Age'),
              color: Colors.blue,
              onPressed: (){
                context.read<UserCubit>().changeAge(40);
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              child: Text('Add Profesion'),
              color: Colors.blue,
              onPressed: (){
                final l = context.read<UserCubit>().getProfesionsLength();
                context.read<UserCubit>().addProfesion('Profesion ${l-1}');
                Navigator.pop(context);
              },
            ),
          ],
        ),
     ),
   );
  }
}
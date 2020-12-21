import 'package:estados/bloc/user/user_cubit.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatelessWidget {
  static final routeName = 'First';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete), 
            onPressed: (){
              context.read<UserCubit>().deleteUser();
            }
          )
        ],
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (_, state) {
          if(state is UserInit)
            return Center(child: Text('No hay informacion del usuario'),);
          else if(state is UserActive){
            return InfoUser(state.user);
          }
          else
            return Center(child: Text('Estado no reconocido'),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.next_plan),
        onPressed: () => Navigator.pushNamed(context, 'second'),
      ),
    );
  }
}

class InfoUser extends StatelessWidget {

  final User user;

  const InfoUser(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Text(
            'General',
            style: TextStyle(fontSize: 20),
          ),
          Text('Name: ${user.name}'),
          Text('Age: ${user.age}'),
          Divider(),
          Text(
            'Profesions',
            style: TextStyle(fontSize: 20),
          ),
          ...user.profesions.map((e) => Text(e)).toList(),
          Divider(),
        ],
      ),
    );
  }
}

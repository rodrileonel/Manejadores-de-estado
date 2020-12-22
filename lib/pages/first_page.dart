import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados/bloc/user/user_bloc.dart';

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        actions: [
          IconButton(icon: Icon(Icons.delete), onPressed: (){
            BlocProvider.of<UserBloc>(context).add(DeleteUser());
          })
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if(state.exists)
            return InitUser(state.user);
          else
            return Center(child: Text('No hay informacion del usuario'),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.next_plan),
        onPressed: () => Navigator.pushNamed(context, 'second'),
      ),
    );
  }
}

class InitUser extends StatelessWidget {
  
  final User user;

  const InitUser(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Text('General',style: TextStyle(fontSize: 20),),
          Text('Name: ${user.name}'),
          Text('Age: ${user.age}'),
          Divider(),
          Text('Profesions',style: TextStyle(fontSize: 20),),
          Divider(),
          //if(user.profesions!=null)
            ...user.profesions.map((e) => Text(e))
        ],
      ),
    );
  }
}

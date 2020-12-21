import 'package:estados/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: (userService.exists)? Text('${userService.user.name}') :Text('First Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.remove), 
            onPressed: () {
              userService.removeUser();
            }
          )
        ],
      ),
      body: (userService.exists) ? InfoUser(service: userService,) : Center(child:Text('No hay informacion del usuario', style: TextStyle(fontSize: 20),)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.next_plan),
        onPressed: () => Navigator.pushNamed(context, 'second'),
      ),
    );
  }
}

class InfoUser extends StatelessWidget {

  final UserService service;

  const InfoUser({ @required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Text('General',style: TextStyle(fontSize: 20),),
          Text('Name: ${service.user.name}'),
          Text('Age: ${service.user.age}'),
          Divider(),
          Text('Profesions',style: TextStyle(fontSize: 20),),
          Expanded(
            child: ListView.builder(
              itemCount: service.user.profesions.length,
              itemBuilder: (BuildContext context, int index) {
                return Text('${service.user.profesions[index]}');
              },
            ),
          ),
          Divider(),
        ],
      ),
     );
  }
}
import 'package:estados/models/user.dart';
import 'package:estados/services/user_service.dart';
import 'package:flutter/material.dart';


class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot){
          return snapshot.hasData
            ?Text(userService.user.name)
            :Text('First Page');
          },
        ),
      ),
      body: StreamBuilder(
        stream: userService.userStream ,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot){
          return snapshot.hasData
            ?InfoUser(userService.user)
            :Center(child: Text('No hay informacion del usuario', style: TextStyle(fontSize: 20),));
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
          Text('General',style: TextStyle(fontSize: 20),),
          Text('Name: ${this.user.name}'),
          Text('Age: ${this.user.age}'),
          Divider(),
          Text('Profesions',style: TextStyle(fontSize: 20),),
          Expanded(
            child: ListView.builder(
              itemCount: this.user.profesions.length,
              itemBuilder: (BuildContext context, int index) {
                return Text('${this.user.profesions[index]}');
              },
            ),
          ),
          Divider(),
        ],
      ),
     );
  }
}
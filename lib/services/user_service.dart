
import 'dart:async';

import 'package:estados/models/user.dart';

class _UserService{

  User _user;

  StreamController<User> _userStreamController = StreamController<User>.broadcast();

  User get user => this._user;
  bool get exists => (this._user!=null) ? true : false;

  Stream<User> get userStream => _userStreamController.stream;

  set user(User value){
    this._user = value;
    _userStreamController.sink.add(value);
    //this._userStreamController.add(value);
  }

  void changeAge(int age){
    this._user.age = age;
    _userStreamController.sink.add(this._user);
  }

  void addProfession(String profession){
    this._user.profesions.add(profession);
    _userStreamController.sink.add(this._user);
  }

  void dispose(){
    _userStreamController?.close();
  }

}

final userService = _UserService();

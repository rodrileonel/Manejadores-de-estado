

import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';

class UserService with ChangeNotifier{

  User _user;

  User get user => this._user;
  bool get exists => (this._user!=null)?true:false;

  set user(value){
    this._user = value;
    notifyListeners();
  }

  void changeAge(int age){
    this._user.age = age;
    notifyListeners();
  }

  void addProfesion(String profesion){
    this._user.profesions.add('$profesion ${this._user.profesions.length +1}');
    notifyListeners();
  }

  void removeUser(){
    this._user = null;
    notifyListeners();
  }
  
}
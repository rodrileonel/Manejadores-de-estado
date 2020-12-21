//este archivo contiene los estados que el cubit va a manejar,
// por lo tanto va a ser parte de el user_cubit.dart
part of 'user_cubit.dart';

@immutable //los estados deben ser inmutables
abstract class UserState{}

class UserInit extends UserState{
  //como estoy en el estado inicial, se que no existe un usuario
  final exists = false;

  @override
  String toString() {
    return 'Usuario: $exists';
  }
}

class UserActive extends UserState{
  final exists = true;
  final User user;

  UserActive(this.user); 

}
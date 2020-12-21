import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados/models/user.dart';

//este archivo es padre del archivo user_state.dart
part 'user_state.dart';

//mi cubit va a manejar unicamente UserState
class UserCubit extends Cubit<UserState>{

  // cuando llame al constructor, llamo al estado inicial 
  // que tiene el exists en false
  UserCubit() : super(UserInit());

  void generateUser(User user){
    emit(UserActive(user));
  }

  void changeAge(int age){
    //(state as UserActive).user.age =40;
    //emit(UserActive((state as UserActive).user));

    //siempre debo regresar un nuevo estado y no mutar el anterior
    final currentState = state;
    if(currentState is UserActive){
      final newUser = currentState.user.copyWith(age:40);
      emit(UserActive(newUser));
    }
  }

  void addProfesion(String profession){
    final currentState = state;
    if(currentState is UserActive){
      currentState.user.profesions.add(profession);
      final newUser = currentState.user.copyWith();
      emit(UserActive(newUser));
    }
  }

  int getProfesionsLength(){
    final currentState = state;
    if(currentState is UserActive){
      return currentState.user.profesions.length;
    }
    return 0;
  }

  deleteUser(){
    emit(UserInit());
  }

}
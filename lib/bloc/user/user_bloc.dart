import 'package:bloc/bloc.dart';
import 'package:estados/models/user.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent,UserState> {

  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async*{ // estyo es una funcion generadora
    // async* resuleve un Stream mientras que async resuelve un Future
    // yield es como un return pero para Streams
    if(event is UserActive)
      yield state.copyWith(
        user: event.user
      );
    if(event is ChangeAge && state.user!=null)
      yield state.copyWith(
        user: state.user.copyWith(age: event.age)
      );
    if(event is AddProfession && state.user!=null){
      yield state.copyWith(
        user: state.user.copyWith(profesions: [
          ...state.user.profesions,
          event.profession
        ])
      );
    }
    if(event is DeleteUser)
      yield state.init();
    //no necesito el else porque si no retornamos nada es ignorado automaticamente
  }

}

// async - await => Future
// async* - yield => Stream
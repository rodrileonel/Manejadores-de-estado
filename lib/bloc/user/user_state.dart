part of 'user_bloc.dart';

class UserState{
  final bool exists;
  final User user;

  UserState({User user})
    : this.user = user ?? null,
      this.exists = (user!=null)?true:false;

  UserState copyWith({User user}) => UserState(
    user: user??this.user
  );

  UserState init() => UserState();

}

class User{
  final String name;
  final int age;
  final List<String> profesions;

  User({this.name, this.age, this.profesions});

  //el usuario no se cambis lo que se debe de hacer es crear una copia,
  //ya que deberia ser inmutable
  User copyWith({
    String name,
    int age, 
    List<String> profesions
  }) => 
    User(
      name : name ?? this.name,
      age: age ?? this.age,
      profesions: profesions ?? this.profesions
    );
}
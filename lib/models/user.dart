
class User{
  final String name;
  final int age;
  final List<String> profesions;

  User({this.name, this.age, this.profesions});

  User copyWith({String name, int age, List<String> profesions}) =>
    User(
      name: name??this.name,
      age:age??this.age,
      profesions:profesions??this.profesions
    );
}
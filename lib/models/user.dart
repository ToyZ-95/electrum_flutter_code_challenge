class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  static User fromMap(Map<String, dynamic> map) {
    return User(
        id: map["id"],
        email: map["email"],
        firstName: map["first_name"],
        lastName: map["last_name"],
        avatar: map["avatar"]);
  }
}

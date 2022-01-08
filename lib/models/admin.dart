class Admin {
  String? firstName;
  String? lastName;
  String? password;
  String? username;
  String? email;

  Admin({
    this.firstName = '',
    this.lastName = '',
    this.password = '',
    this.username = '',
    this.email = '',
  });

  Map<String, dynamic> toMap() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Password": password,
      "Username": username,
      "Email": email,
    };
  }

  static Admin fromMap(Map<String, Object?> map) {
    return Admin(
      firstName: map["FirstName"].toString(),
      lastName: map["LastName"].toString(),
      password: map["Password"].toString(),
      username: map["Username"].toString(),
      email: map["Email"].toString(),
    );
  }
}

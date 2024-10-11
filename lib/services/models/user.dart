class User {
  User({this.name, this.email, this.password});

  String? name;
  String? email;
  String? password;

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }
}

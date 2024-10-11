class SignupBody {
  String? name;
  String? email;
  String? password;

  SignupBody({
    this.name,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

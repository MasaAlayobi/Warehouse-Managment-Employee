// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
 String password;
 String email;
  LoginModel({
    required this.password,
    required this.email,
  });

  LoginModel copyWith({
    String? password,
    String? email,
  }) {
    return LoginModel(
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'email': email,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginModel(password: $password, email: $email)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.password == password &&
      other.email == email;
  }

  @override
  int get hashCode => password.hashCode ^ email.hashCode;
}

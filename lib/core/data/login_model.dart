// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  String password;
  String email;
  String firebase_token;
  LoginModel({
    required this.password,
    required this.email,
    required this.firebase_token,
  });

  LoginModel copyWith({
    String? password,
    String? email,
    String? firebase_token,
  }) {
    return LoginModel(
      password: password ?? this.password,
      email: email ?? this.email,
      firebase_token: firebase_token ?? this.firebase_token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'email': email,
      'firebase_token': firebase_token,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      password: map['password'] as String,
      email: map['email'] as String,
      firebase_token: map['firebase_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginModel(password: $password, email: $email, firebase_token: $firebase_token)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.password == password &&
      other.email == email &&
      other.firebase_token == firebase_token;
  }

  @override
  int get hashCode => password.hashCode ^ email.hashCode ^ firebase_token.hashCode;
}

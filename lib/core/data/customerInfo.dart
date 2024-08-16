// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomerinfoModel {
  int id;
  String? name;
  String? email;
  String? location;
  CustomerinfoModel({
    required this.id,
    this.name,
    this.email,
    this.location,
  });

  CustomerinfoModel copyWith({
    int? id,
    String? name,
    String? email,
    String? location,
  }) {
    return CustomerinfoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'location': location,
    };
  }

  factory CustomerinfoModel.fromMap(Map<dynamic, dynamic> map) {
    return CustomerinfoModel(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerinfoModel.fromJson(String source) =>
      CustomerinfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerinfoModel(id: $id, name: $name, email: $email, location: $location)';
  }

  @override
  bool operator ==(covariant CustomerinfoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ location.hashCode;
  }
}

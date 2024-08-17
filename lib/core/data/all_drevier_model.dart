// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AllDrevierModel {
  int id;
  String? name;
  String? email;
  String? location;
  AllDrevierModel({
    required this.id,
    this.name,
    this.email,
    this.location,
  });

  AllDrevierModel copyWith({
    int? id,
    String? name,
    String? email,
    String? location,
  }) {
    return AllDrevierModel(
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

  factory AllDrevierModel.fromMap(Map<String, dynamic> map) {
    return AllDrevierModel(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllDrevierModel.fromJson(String source) => AllDrevierModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AllDrevierModel(id: $id, name: $name, email: $email, location: $location)';
  }

  @override
  bool operator ==(covariant AllDrevierModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      location.hashCode;
  }
}

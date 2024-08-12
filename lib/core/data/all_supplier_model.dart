// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AllSupplierModel {
  int id;
  String name;
  String email;
  String location;
  AllSupplierModel({
    required this.id,
    required this.name,
    required this.email,
    required this.location,
  });

  AllSupplierModel copyWith({
    int? id,
    String? name,
    String? email,
    String? location,
  }) {
    return AllSupplierModel(
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

  factory AllSupplierModel.fromMap(Map<String, dynamic> map) {
    return AllSupplierModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      location: map['location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllSupplierModel.fromJson(String source) => AllSupplierModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AllSupplierModel(id: $id, name: $name, email: $email, location: $location)';
  }

  @override
  bool operator ==(covariant AllSupplierModel other) {
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

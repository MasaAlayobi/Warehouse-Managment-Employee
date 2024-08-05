// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class DetailsacleintModel {
  int id;
  String? name;
  String? email;
  String? location;
  List<Map<String, dynamic>> phones;
  DetailsacleintModel({
    required this.id,
    this.name,
    this.email,
    this.location,
    required this.phones,
  });

  DetailsacleintModel copyWith({
    int? id,
    String? name,
    String? email,
    String? location,
    List<Map<String, dynamic>>? phones,
  }) {
    return DetailsacleintModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      location: location ?? this.location,
      phones: phones ?? this.phones,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'location': location,
      'phones': phones,
    };
  }

  factory DetailsacleintModel.fromMap(Map<String, dynamic> map) {
    return DetailsacleintModel(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      phones: List<Map<String, dynamic>>.from(
        (map['phones'] as List<dynamic>).map<Map<String, dynamic>>(
          (x) => x,
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsacleintModel.fromJson(String source) =>
      DetailsacleintModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DetailsacleintModel(id: $id, name: $name, email: $email, location: $location, phones: $phones)';
  }

  @override
  bool operator ==(covariant DetailsacleintModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.location == location &&
        listEquals(other.phones, phones);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        location.hashCode ^
        phones.hashCode;
  }
}

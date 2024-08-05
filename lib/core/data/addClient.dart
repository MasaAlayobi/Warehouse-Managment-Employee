// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mobile_warehouse_managment/core/data/location.dart';

class AddclientModel {
  List<Map<String, dynamic>> phones;
  Map<String, dynamic> location;
  String? name;
  String? email;
  AddclientModel({
    required this.phones,
    required this.location,
    this.name,
    this.email,
  });

  AddclientModel copyWith({
    List<Map<String, dynamic>>? phones,
    Map<String, dynamic>? location,
    String? name,
    String? email,
  }) {
    return AddclientModel(
      phones: phones ?? this.phones,
      location: location ?? this.location,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phones': phones,
      'location': location,
      'name': name,
      'email': email,
    };
  }

  factory AddclientModel.fromMap(Map<String, dynamic> map) {
    return AddclientModel(
      phones: List<Map<String, dynamic>>.from(
        (map['phones'] as List<dynamic>).map<Map<String, dynamic>>(
          (x) => x,
        ),
      ),
      location: Map<String, dynamic>.from(
        (map['location'] as Map<String, dynamic>),
      ),
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddclientModel.fromJson(String source) =>
      AddclientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddclientModel(phones: $phones, location: $location, name: $name, email: $email)';
  }

  @override
  bool operator ==(covariant AddclientModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.phones, phones) &&
        mapEquals(other.location, location) &&
        other.name == name &&
        other.email == email;
  }

  @override
  int get hashCode {
    return phones.hashCode ^ location.hashCode ^ name.hashCode ^ email.hashCode;
  }
}

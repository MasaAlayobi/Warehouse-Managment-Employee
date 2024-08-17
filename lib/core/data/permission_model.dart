// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PermissionModel {
  int id;
  String name;
  PermissionModel({
    required this.id,
    required this.name,
  });

  PermissionModel copyWith({
    int? id,
    String? name,
  }) {
    return PermissionModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory PermissionModel.fromMap(Map<dynamic, dynamic> map) {
    return PermissionModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PermissionModel.fromJson(String source) => PermissionModel.fromMap(json.decode(source) as Map<double, dynamic>);

  @override
  String toString() => 'PermissionModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant PermissionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

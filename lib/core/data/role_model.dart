// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobile_warehouse_managment/core/data/permission_model.dart';

class RoleModel {
  int id;
  PermissionModel permissions;
  RoleModel({
    required this.id,
    required this.permissions,
  });

  RoleModel copyWith({
    int? id,
    PermissionModel? permissions,
  }) {
    return RoleModel(
      id: id ?? this.id,
      permissions: permissions ?? this.permissions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'permissions': permissions.toMap(),
    };
  }

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      id: map['id'] as int,
      permissions: PermissionModel.fromMap(map['permissions'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory RoleModel.fromJson(String source) => RoleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RoleModel(id: $id, permissions: $permissions)';

  @override
  bool operator ==(covariant RoleModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.permissions == permissions;
  }

  @override
  int get hashCode => id.hashCode ^ permissions.hashCode;
}

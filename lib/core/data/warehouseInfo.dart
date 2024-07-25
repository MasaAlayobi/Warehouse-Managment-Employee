// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WarehouseInfoModel {
  int id;
  String name;
  String size;
  String capacity;
  WarehouseInfoModel({
    required this.id,
    required this.name,
    required this.size,
    required this.capacity,
  });

  WarehouseInfoModel copyWith({
    int? id,
    String? name,
    String? size,
    String? capacity,
  }) {
    return WarehouseInfoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      size: size ?? this.size,
      capacity: capacity ?? this.capacity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'size': size,
      'capacity': capacity,
    };
  }

  factory WarehouseInfoModel.fromMap(Map<String, dynamic> map) {
    return WarehouseInfoModel(
      id: map['id'] as int,
      name: map['name'] as String,
      size: map['size'] as String,
      capacity: map['capacity'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WarehouseInfoModel.fromJson(String source) =>
      WarehouseInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WarehouseInfoModel(id: $id, name: $name, size: $size, capacity: $capacity)';
  }

  @override
  bool operator ==(covariant WarehouseInfoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.size == size &&
        other.capacity == capacity;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ size.hashCode ^ capacity.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WarehouseInfoModel {
  int id;
  String? name;
  String? size;
  String? capacity;
  String? location;
  WarehouseInfoModel({
    required this.id,
    this.name,
    this.size,
    this.capacity,
    this.location,
  });

  WarehouseInfoModel copyWith({
    int? id,
    String? name,
    String? size,
    String? capacity,
    String? location,
  }) {
    return WarehouseInfoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      size: size ?? this.size,
      capacity: capacity ?? this.capacity,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'size': size,
      'capacity': capacity,
      'location': location,
    };
  }

  factory WarehouseInfoModel.fromMap(Map<String, dynamic> map) {
    return WarehouseInfoModel(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      size: map['size'] != null ? map['size'] as String : null,
      capacity: map['capacity'] != null ? map['capacity'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WarehouseInfoModel.fromJson(String source) =>
      WarehouseInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WarehouseInfoModel(id: $id, name: $name, size: $size, capacity: $capacity, location: $location)';
  }

  @override
  bool operator ==(covariant WarehouseInfoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.size == size &&
        other.capacity == capacity &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        size.hashCode ^
        capacity.hashCode ^
        location.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ViaclesInWareModel {
  int? id;
  String? name;
  String? size_cubic_meters;
  String? load_capacity_kg;
  String? plate_number;
  String? status;
  ViaclesInWareModel({
    this.id,
    this.name,
    this.size_cubic_meters,
    this.load_capacity_kg,
    this.plate_number,
    this.status,
  });

  ViaclesInWareModel copyWith({
    int? id,
    String? name,
    String? size_cubic_meters,
    String? load_capacity_kg,
    String? plate_number,
    String? status,
  }) {
    return ViaclesInWareModel(
      id: id ?? this.id,
      name: name ?? this.name,
      size_cubic_meters: size_cubic_meters ?? this.size_cubic_meters,
      load_capacity_kg: load_capacity_kg ?? this.load_capacity_kg,
      plate_number: plate_number ?? this.plate_number,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'size_cubic_meters': size_cubic_meters,
      'load_capacity_kg': load_capacity_kg,
      'plate_number': plate_number,
      'status': status,
    };
  }

  factory ViaclesInWareModel.fromMap(Map<String, dynamic> map) {
    return ViaclesInWareModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      size_cubic_meters: map['size_cubic_meters'] != null
          ? map['size_cubic_meters'] as String
          : null,
      load_capacity_kg: map['load_capacity_kg'] != null
          ? map['load_capacity_kg'] as String
          : null,
      plate_number:
          map['plate_number'] != null ? map['plate_number'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ViaclesInWareModel.fromJson(String source) =>
      ViaclesInWareModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ViaclesInWareModel(id: $id, name: $name, size_cubic_meters: $size_cubic_meters, load_capacity_kg: $load_capacity_kg, plate_number: $plate_number, status: $status)';
  }

  @override
  bool operator ==(covariant ViaclesInWareModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.size_cubic_meters == size_cubic_meters &&
        other.load_capacity_kg == load_capacity_kg &&
        other.plate_number == plate_number &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        size_cubic_meters.hashCode ^
        load_capacity_kg.hashCode ^
        plate_number.hashCode ^
        status.hashCode;
  }
}

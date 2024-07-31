// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class storeItemInWHModel {
  int? warehouse_id;
  num? min_quantity;
  num? available_quantity;
  num? real_quantity;
  storeItemInWHModel({
    required this.warehouse_id,
    required this.min_quantity,
    required this.available_quantity,
    required this.real_quantity,
  });

  storeItemInWHModel copyWith({
    int? warehouse_id,
    num? min_quantity,
    num? available_quantity,
    num? real_quantity,
  }) {
    return storeItemInWHModel(
      warehouse_id: warehouse_id ?? this.warehouse_id,
      min_quantity: min_quantity ?? this.min_quantity,
      available_quantity: available_quantity ?? this.available_quantity,
      real_quantity: real_quantity ?? this.real_quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'warehouse_id': warehouse_id,
      'min_quantity': min_quantity,
      'available_quantity': available_quantity,
      'real_quantity': real_quantity,
    };
  }

  factory storeItemInWHModel.fromMap(Map<String, dynamic> map) {
    return storeItemInWHModel(
      warehouse_id:
          map['warehouse_id'] != null ? map['warehouse_id'] as int : null,
      min_quantity:
          map['min_quantity'] != null ? map['min_quantity'] as num : null,
      available_quantity: map['available_quantity'] != null
          ? map['available_quantity'] as num
          : null,
      real_quantity:
          map['real_quantity'] != null ? map['real_quantity'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory storeItemInWHModel.fromJson(String source) =>
      storeItemInWHModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'storeItemInWHModel(warehouse_id: $warehouse_id, min_quantity: $min_quantity, available_quantity: $available_quantity, real_quantity: $real_quantity)';
  }

  @override
  bool operator ==(covariant storeItemInWHModel other) {
    if (identical(this, other)) return true;

    return other.warehouse_id == warehouse_id &&
        other.min_quantity == min_quantity &&
        other.available_quantity == available_quantity &&
        other.real_quantity == real_quantity;
  }

  @override
  int get hashCode {
    return warehouse_id.hashCode ^
        min_quantity.hashCode ^
        available_quantity.hashCode ^
        real_quantity.hashCode;
  }
}

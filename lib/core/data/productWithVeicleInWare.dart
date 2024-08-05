// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mobile_warehouse_managment/core/data/viacles.dart';
import 'package:mobile_warehouse_managment/core/data/warehouseProduct.dart';

class ProductwithveicleinwareModel {
  int id;
  String? name;
  String? size;
  String? capacity;
  String? location;

  List<WarehouseproductModel> items;
  List<ViaclesInWareModel> vehciles;
  ProductwithveicleinwareModel({
    required this.id,
    this.name,
    this.size,
    this.capacity,
    this.location,
    required this.items,
    required this.vehciles,
  });

  ProductwithveicleinwareModel copyWith({
    int? id,
    String? name,
    String? size,
    String? capacity,
    String? location,
    List<WarehouseproductModel>? items,
    List<ViaclesInWareModel>? vehciles,
  }) {
    return ProductwithveicleinwareModel(
      id: id ?? this.id,
      name: name ?? this.name,
      size: size ?? this.size,
      capacity: capacity ?? this.capacity,
      location: location ?? this.location,
      items: items ?? this.items,
      vehciles: vehciles ?? this.vehciles,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'size': size,
      'capacity': capacity,
      'location': location,
      'items': items.map((x) => x.toMap()).toList(),
      'vehciles': vehciles.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductwithveicleinwareModel.fromMap(Map<String, dynamic> map) {
    return ProductwithveicleinwareModel(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      size: map['size'] != null ? map['size'] as String : null,
      capacity: map['capacity'] != null ? map['capacity'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      items: List<WarehouseproductModel>.from(
        (map['items'] as List<dynamic>).map<WarehouseproductModel>(
          (x) => WarehouseproductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      vehciles: List<ViaclesInWareModel>.from(
        (map['vehciles'] as List<dynamic>).map<ViaclesInWareModel>(
          (x) => ViaclesInWareModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductwithveicleinwareModel.fromJson(String source) =>
      ProductwithveicleinwareModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductwithveicleinwareModel(id: $id, name: $name, size: $size, capacity: $capacity, location: $location, items: $items, vehciles: $vehciles)';
  }

  @override
  bool operator ==(covariant ProductwithveicleinwareModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.size == size &&
        other.capacity == capacity &&
        other.location == location &&
        listEquals(other.items, items) &&
        listEquals(other.vehciles, vehciles);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        size.hashCode ^
        capacity.hashCode ^
        location.hashCode ^
        items.hashCode ^
        vehciles.hashCode;
  }
}

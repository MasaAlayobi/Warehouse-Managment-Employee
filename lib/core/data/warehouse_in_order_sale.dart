// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mobile_warehouse_managment/core/data/warehouseProduct.dart';

class WarehouseInOrderSale {
  int id;
  String name;
  List<WarehouseproductModel> items;
  WarehouseInOrderSale({
    required this.id,
    required this.name,
    required this.items,
  });

  WarehouseInOrderSale copyWith({
    int? id,
    String? name,
    List<WarehouseproductModel>? items,
  }) {
    return WarehouseInOrderSale(
      id: id ?? this.id,
      name: name ?? this.name,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory WarehouseInOrderSale.fromMap(Map<String, dynamic> map) {
    return WarehouseInOrderSale(
      id: map['id'] as int,
      name: map['name'] as String,
      items: List<WarehouseproductModel>.from((map['items'] as List<dynamic>).map<WarehouseproductModel>((x) => WarehouseproductModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory WarehouseInOrderSale.fromJson(String source) => WarehouseInOrderSale.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WarehouseInOrderSale(id: $id, name: $name, items: $items)';

  @override
  bool operator ==(covariant WarehouseInOrderSale other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      listEquals(other.items, items);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ items.hashCode;
}

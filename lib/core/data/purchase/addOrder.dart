// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mobile_warehouse_managment/core/data/purchase/quantityItem.dart';

class AddOrderPurchaseModel {
  int warehouse_id;
  String payment_type;
  int supplier_id;
  List<Map> items;
  AddOrderPurchaseModel({
    required this.warehouse_id,
    required this.payment_type,
    required this.supplier_id,
    required this.items,
  });

  AddOrderPurchaseModel copyWith({
    int? warehouse_id,
    String? payment_type,
    int? supplier_id,
    List<Map>? items,
  }) {
    return AddOrderPurchaseModel(
      warehouse_id: warehouse_id ?? this.warehouse_id,
      payment_type: payment_type ?? this.payment_type,
      supplier_id: supplier_id ?? this.supplier_id,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'warehouse_id': warehouse_id,
      'payment_type': payment_type,
      'supplier_id': supplier_id,
      'items': items,
    };
  }

  factory AddOrderPurchaseModel.fromMap(Map<String, dynamic> map) {
    return AddOrderPurchaseModel(
      warehouse_id: map['warehouse_id'] as int,
      payment_type: map['payment_type'] as String,
      supplier_id: map['supplier_id'] as int,
      items: List<Map>.from(
        (map['items'] as List<dynamic>).map<Map>(
          (x) => x,
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddOrderPurchaseModel.fromJson(String source) =>
      AddOrderPurchaseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddOrderPurchaseModel(warehouse_id: $warehouse_id, payment_type: $payment_type, supplier_id: $supplier_id, items: $items)';
  }

  @override
  bool operator ==(covariant AddOrderPurchaseModel other) {
    if (identical(this, other)) return true;

    return other.warehouse_id == warehouse_id &&
        other.payment_type == payment_type &&
        other.supplier_id == supplier_id &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return warehouse_id.hashCode ^
        payment_type.hashCode ^
        supplier_id.hashCode ^
        items.hashCode;
  }
}

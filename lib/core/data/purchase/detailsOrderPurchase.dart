// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mobile_warehouse_managment/core/data/customerInfo.dart';
import 'package:mobile_warehouse_managment/core/data/item_in_stripped.dart';
import 'package:mobile_warehouse_managment/core/data/purchase/itemsInOrderPurchase.dart';
import 'package:mobile_warehouse_managment/core/data/warehouseInfo.dart';

class DetailsPurchaseOrderModel {
  String? price;
  String? payment_type;
  String? payment_at;
  WarehouseInfoModel? warehouse;
  List<ItemsInOrderPurchase> items;

  DetailsPurchaseOrderModel({
    this.price,
    this.payment_type,
    this.payment_at,
    this.warehouse,
    required this.items,

  });

  DetailsPurchaseOrderModel copyWith({
    String? price,
    String? payment_type,
    String? payment_at,
    WarehouseInfoModel? warehouse,
    List<ItemsInOrderPurchase>? items,
  }) {
    return DetailsPurchaseOrderModel(
      price: price ?? this.price,
      payment_type: payment_type ?? this.payment_type,
      payment_at: payment_at ?? this.payment_at,
      warehouse: warehouse ?? this.warehouse,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'price': price,
      'payment_type': payment_type,
      'payment_at': payment_at,
      'warehouse': warehouse?.toMap(),
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory DetailsPurchaseOrderModel.fromMap(Map<String, dynamic> map) {
    return DetailsPurchaseOrderModel(
      price: map['price'] != null ? map['price'] as String : null,
      payment_type: map['payment_type'] != null ? map['payment_type'] as String : null,
      payment_at: map['payment_at'] != null ? map['payment_at'] as String : null,
      warehouse: map['warehouse'] != null ? WarehouseInfoModel.fromMap(map['warehouse'] as Map<String,dynamic>) : null,
      items: List<ItemsInOrderPurchase>.from((map['items'] as List<dynamic>).map<ItemsInOrderPurchase>((x) => ItemsInOrderPurchase.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsPurchaseOrderModel.fromJson(String source) => DetailsPurchaseOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DetailsPurchaseOrderModel(price: $price, payment_type: $payment_type, payment_at: $payment_at, warehouse: $warehouse, items: $items)';
  }

  @override
  bool operator ==(covariant DetailsPurchaseOrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.price == price &&
      other.payment_type == payment_type &&
      other.payment_at == payment_at &&
      other.warehouse == warehouse &&
      listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return price.hashCode ^
      payment_type.hashCode ^
      payment_at.hashCode ^
      warehouse.hashCode ^
      items.hashCode;
  }
}

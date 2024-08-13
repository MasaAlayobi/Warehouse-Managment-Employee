// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobile_warehouse_managment/core/data/customerInfo.dart';
import 'package:mobile_warehouse_managment/core/data/warehouseInfo.dart';

class PurchaseOrderModel {
  String? price;
  String? payment_type;
  String? payment_at;
  WarehouseInfoModel warehouse;

  PurchaseOrderModel({
    this.price,
    this.payment_type,
    this.payment_at,
    required this.warehouse,
  });

  PurchaseOrderModel copyWith({
    String? price,
    String? payment_type,
    String? payment_at,
    WarehouseInfoModel? warehouse,
  }) {
    return PurchaseOrderModel(
      price: price ?? this.price,
      payment_type: payment_type ?? this.payment_type,
      payment_at: payment_at ?? this.payment_at,
      warehouse: warehouse ?? this.warehouse,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'price': price,
      'payment_type': payment_type,
      'payment_at': payment_at,
      'warehouse': warehouse.toMap(),
    };
  }

  factory PurchaseOrderModel.fromMap(Map<String, dynamic> map) {
    return PurchaseOrderModel(
      price: map['price'] != null ? map['price'] as String : null,
      payment_type: map['payment_type'] != null ? map['payment_type'] as String : null,
      payment_at: map['payment_at'] != null ? map['payment_at'] as String : null,
      warehouse: WarehouseInfoModel.fromMap(map['warehouse'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseOrderModel.fromJson(String source) => PurchaseOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PurchaseOrderModel(price: $price, payment_type: $payment_type, payment_at: $payment_at, warehouse: $warehouse)';
  }

  @override
  bool operator ==(covariant PurchaseOrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.price == price &&
      other.payment_type == payment_type &&
      other.payment_at == payment_at &&
      other.warehouse == warehouse;
  }

  @override
  int get hashCode {
    return price.hashCode ^
      payment_type.hashCode ^
      payment_at.hashCode ^
      warehouse.hashCode;
  }
}

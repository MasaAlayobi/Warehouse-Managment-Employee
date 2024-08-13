// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AddSaleOrderModel {
 int client_id;
 int warehouse_id;
 String payment_type;
 List<Map> items; 
  AddSaleOrderModel({
    required this.client_id,
    required this.warehouse_id,
    required this.payment_type,
    required this.items,
  });

  AddSaleOrderModel copyWith({
    int? client_id,
    int? warehouse_id,
    String? payment_type,
    List<Map>? items,
  }) {
    return AddSaleOrderModel(
      client_id: client_id ?? this.client_id,
      warehouse_id: warehouse_id ?? this.warehouse_id,
      payment_type: payment_type ?? this.payment_type,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'client_id': client_id,
      'warehouse_id': warehouse_id,
      'payment_type': payment_type,
      'items': items,
    };
  }

  factory AddSaleOrderModel.fromMap(Map<String, dynamic> map) {
    return AddSaleOrderModel(
      client_id: map['client_id'] as int,
      warehouse_id: map['warehouse_id'] as int,
      payment_type: map['payment_type'] as String,
      items: List<Map>.from((map['items'] as List<dynamic>).map<Map>((x) => x,),),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddSaleOrderModel.fromJson(String source) => AddSaleOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddSaleOrder(client_id: $client_id, warehouse_id: $warehouse_id, payment_type: $payment_type, items: $items)';
  }

  @override
  bool operator ==(covariant AddSaleOrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.client_id == client_id &&
      other.warehouse_id == warehouse_id &&
      other.payment_type == payment_type &&
      listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return client_id.hashCode ^
      warehouse_id.hashCode ^
      payment_type.hashCode ^
      items.hashCode;
  }
}

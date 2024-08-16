// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mobile_warehouse_managment/core/data/previous_sale_order_model.dart';

class PreviousSaleShipmentModel {
  int id;
  String? tracking_number;
  String? current_capacity;
  String? status;
  List<PreviousSaleOrderModel> sell_order;
  PreviousSaleShipmentModel({
    required this.id,
    this.tracking_number,
    this.current_capacity,
    this.status,
    required this.sell_order,
  });

  PreviousSaleShipmentModel copyWith({
    int? id,
    String? tracking_number,
    String? current_capacity,
    String? status,
    List<PreviousSaleOrderModel>? sell_order,
  }) {
    return PreviousSaleShipmentModel(
      id: id ?? this.id,
      tracking_number: tracking_number ?? this.tracking_number,
      current_capacity: current_capacity ?? this.current_capacity,
      status: status ?? this.status,
      sell_order: sell_order ?? this.sell_order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tracking_number': tracking_number,
      'current_capacity': current_capacity,
      'status': status,
      'sell_order': sell_order.map((x) => x.toMap()).toList(),
    };
  }

  factory PreviousSaleShipmentModel.fromMap(Map<String, dynamic> map) {
    return PreviousSaleShipmentModel(
      id: map['id'] as int,
      tracking_number: map['tracking_number'] != null ? map['tracking_number'] as String : null,
      current_capacity: map['current_capacity'] != null ? map['current_capacity'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      sell_order: List<PreviousSaleOrderModel>.from((map['sell_order'] as List<dynamic>).map<PreviousSaleOrderModel>((x) => PreviousSaleOrderModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory PreviousSaleShipmentModel.fromJson(String source) => PreviousSaleShipmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PreviousSaleShipmentModel(id: $id, tracking_number: $tracking_number, current_capacity: $current_capacity, status: $status, sell_order: $sell_order)';
  }

  @override
  bool operator ==(covariant PreviousSaleShipmentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.tracking_number == tracking_number &&
      other.current_capacity == current_capacity &&
      other.status == status &&
      listEquals(other.sell_order, sell_order);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      tracking_number.hashCode ^
      current_capacity.hashCode ^
      status.hashCode ^
      sell_order.hashCode;
  }
}

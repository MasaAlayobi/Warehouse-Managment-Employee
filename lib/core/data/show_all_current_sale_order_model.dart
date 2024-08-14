// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobile_warehouse_managment/core/data/customerInfo.dart';
import 'package:mobile_warehouse_managment/core/data/purchase/OrderPurchase.dart';

class ShowAllCurrentSaleOrderModel {
  int id;
  String? status;
  PurchaseOrderModel? order;
  CustomerinfoModel? client;
  String? shipment;
  ShowAllCurrentSaleOrderModel({
    required this.id,
    this.status,
    this.order,
    this.client,
    this.shipment,
  });
 

  ShowAllCurrentSaleOrderModel copyWith({
    int? id,
    String? status,
    PurchaseOrderModel? order,
    CustomerinfoModel? client,
    String? shipment,
  }) {
    return ShowAllCurrentSaleOrderModel(
      id: id ?? this.id,
      status: status ?? this.status,
      order: order ?? this.order,
      client: client ?? this.client,
      shipment: shipment ?? this.shipment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'order': order?.toMap(),
      'client': client?.toMap(),
      'shipment': shipment,
    };
  }

  factory ShowAllCurrentSaleOrderModel.fromMap(Map<String, dynamic> map) {
    return ShowAllCurrentSaleOrderModel(
      id: map['id'] as int,
      status: map['status'] != null ? map['status'] as String : null,
      order: map['order'] != null ? PurchaseOrderModel.fromMap(map['order'] as Map<String,dynamic>) : null,
      client: map['client'] != null ? CustomerinfoModel.fromMap(map['client'] as Map<String,dynamic>) : null,
      shipment: map['shipment'] != null ? map['shipment'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShowAllCurrentSaleOrderModel.fromJson(String source) => ShowAllCurrentSaleOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShowAllCurrentSaleOrderModel(id: $id, status: $status, order: $order, client: $client, shipment: $shipment)';
  }

  @override
  bool operator ==(covariant ShowAllCurrentSaleOrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.status == status &&
      other.order == order &&
      other.client == client &&
      other.shipment == shipment;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      status.hashCode ^
      order.hashCode ^
      client.hashCode ^
      shipment.hashCode;
  }
}

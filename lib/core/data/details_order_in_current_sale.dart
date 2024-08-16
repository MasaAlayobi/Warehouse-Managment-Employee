// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:mobile_warehouse_managment/core/data/all_shipment_model.dart';
import 'package:mobile_warehouse_managment/core/data/customerInfo.dart';
import 'package:mobile_warehouse_managment/core/data/purchase/detailsOrderPurchase.dart';

class DetailsOrderInCurrentSale {
  int id;
  String? status;
  AllShipmentModel? shipment;
  DetailsPurchaseOrderModel? order;
  CustomerinfoModel? client;
  DetailsOrderInCurrentSale({
    required this.id,
    this.status,
    this.shipment,
    this.order,
    this.client,
  });
  

  DetailsOrderInCurrentSale copyWith({
    int? id,
    String? status,
    AllShipmentModel? shipment,
    DetailsPurchaseOrderModel? order,
    CustomerinfoModel? client,
  }) {
    return DetailsOrderInCurrentSale(
      id: id ?? this.id,
      status: status ?? this.status,
      shipment: shipment ?? this.shipment,
      order: order ?? this.order,
      client: client ?? this.client,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'shipment': shipment,
      'order': order?.toMap(),
      'client': client?.toMap(),
    };
  }

  factory DetailsOrderInCurrentSale.fromMap(Map<dynamic, dynamic> map) {
    return DetailsOrderInCurrentSale(
      id: map['id'] as int,
      status: map['status'] != null ? map['status'] as String : null,
      shipment: map['shipment'] != null ? AllShipmentModel.fromMap(map['shipment'] as Map<dynamic,dynamic>)  : null,
      order: map['order'] != null ? DetailsPurchaseOrderModel.fromMap(map['order'] as Map<dynamic,dynamic>) : null,
      client: map['client'] != null ? CustomerinfoModel.fromMap(map['client'] as Map<dynamic,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsOrderInCurrentSale.fromJson(String source) => DetailsOrderInCurrentSale.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() {
    return 'DetailsOrderInCurrentSale(id: $id, status: $status, shipment: $shipment, order: $order, client: $client)';
  }

  @override
  bool operator ==(covariant DetailsOrderInCurrentSale other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.status == status &&
      other.shipment == shipment &&
      other.order == order &&
      other.client == client;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      status.hashCode ^
      shipment.hashCode ^
      order.hashCode ^
      client.hashCode;
  }
}

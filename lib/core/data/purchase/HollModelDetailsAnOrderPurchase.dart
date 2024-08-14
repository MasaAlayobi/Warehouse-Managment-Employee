// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../customerInfo.dart';
import 'OrderPurchase.dart';
import 'detailsOrderPurchase.dart';

class HollModelOfDetailsOrderPurchase {
  

  int id;
  String? status;
  DetailsPurchaseOrderModel? order;
  CustomerinfoModel? supplier;
  HollModelOfDetailsOrderPurchase({
    required this.id,
    this.status,
    this.order,
    this.supplier,
  });


  HollModelOfDetailsOrderPurchase copyWith({
    int? id,
    String? status,
    DetailsPurchaseOrderModel? order,
    CustomerinfoModel? supplier,
  }) {
    return HollModelOfDetailsOrderPurchase(
      id: id ?? this.id,
      status: status ?? this.status,
      order: order ?? this.order,
      supplier: supplier ?? this.supplier,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'order': order?.toMap(),
      'supplier': supplier?.toMap(),
    };
  }

  factory HollModelOfDetailsOrderPurchase.fromMap(Map<String, dynamic> map) {
    return HollModelOfDetailsOrderPurchase(
      id: map['id'] as int,
      status: map['status'] != null ? map['status'] as String : null,
      order: map['order'] != null ? DetailsPurchaseOrderModel.fromMap(map['order'] as Map<String,dynamic>) : null,
      supplier: map['supplier'] != null ? CustomerinfoModel.fromMap(map['supplier'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HollModelOfDetailsOrderPurchase.fromJson(String source) => HollModelOfDetailsOrderPurchase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HollModelOfDetailsOrderPurchase(id: $id, status: $status, order: $order, supplier: $supplier)';
  }

  @override
  bool operator ==(covariant HollModelOfDetailsOrderPurchase other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.status == status &&
      other.order == order &&
      other.supplier == supplier;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      status.hashCode ^
      order.hashCode ^
      supplier.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobile_warehouse_managment/core/data/OrderPurchase.dart';
import 'package:mobile_warehouse_managment/core/data/customerInfo.dart';

class AllPurchaseOrderModel {
  int id;
  String? status;
  PurchaseOrderModel? order;
  CustomerinfoModel? supplier;
  AllPurchaseOrderModel({
    required this.id,
    this.status,
    this.order,
    this.supplier,
  });

  AllPurchaseOrderModel copyWith({
    int? id,
    String? status,
    PurchaseOrderModel? order,
    CustomerinfoModel? supplier,
  }) {
    return AllPurchaseOrderModel(
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

  factory AllPurchaseOrderModel.fromMap(Map<String, dynamic> map) {
    return AllPurchaseOrderModel(
      id: map['id'] as int,
      status: map['status'] != null ? map['status'] as String : null,
      order: map['order'] != null ? PurchaseOrderModel.fromMap(map['order'] as Map<String,dynamic>) : null,
      supplier: map['supplier'] != null ? CustomerinfoModel.fromMap(map['supplier'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllPurchaseOrderModel.fromJson(String source) => AllPurchaseOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AllPurchaseOrderModel(id: $id, status: $status, order: $order, supplier: $supplier)';
  }

  @override
  bool operator ==(covariant AllPurchaseOrderModel other) {
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

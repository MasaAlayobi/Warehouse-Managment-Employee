// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobile_warehouse_managment/core/data/item_in_stripped.dart';

class ItemsInOrderPurchase {
  num? quantity;
  ItemInStripped? item;
  ItemsInOrderPurchase({
    this.quantity,
    this.item,
  });

  ItemsInOrderPurchase copyWith({
    num? quantity,
    ItemInStripped? item,
  }) {
    return ItemsInOrderPurchase(
      quantity: quantity ?? this.quantity,
      item: item ?? this.item,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'item': item?.toMap(),
    };
  }

  factory ItemsInOrderPurchase.fromMap(Map<String, dynamic> map) {
    return ItemsInOrderPurchase(
      quantity: map['quantity'] != null ? map['quantity'] as num : null,
      item: map['item'] != null ? ItemInStripped.fromMap(map['item'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemsInOrderPurchase.fromJson(String source) => ItemsInOrderPurchase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ItemsInOrderPurchase(quantity: $quantity, item: $item)';

  @override
  bool operator ==(covariant ItemsInOrderPurchase other) {
    if (identical(this, other)) return true;
  
    return 
      other.quantity == quantity &&
      other.item == item;
  }

  @override
  int get hashCode => quantity.hashCode ^ item.hashCode;
}

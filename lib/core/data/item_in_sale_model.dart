// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemInSaleModel {
  int id;
  num quantity;
  ItemInSaleModel({
    required this.id,
    required this.quantity,
  });
  

  ItemInSaleModel copyWith({
    int? id,
    num? quantity,
  }) {
    return ItemInSaleModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'id': id,
      'quantity': quantity,
    };
  }

  factory ItemInSaleModel.fromMap(Map<String, dynamic> map) {
    return ItemInSaleModel(
      id: map['id'] as int,
      quantity: map['quantity'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemInSaleModel.fromJson(String source) => ItemInSaleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ItemInSaleModel(id: $id, quantity: $quantity)';

  @override
  bool operator ==(covariant ItemInSaleModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.quantity == quantity;
  }

  @override
  int get hashCode => id.hashCode ^ quantity.hashCode;
}

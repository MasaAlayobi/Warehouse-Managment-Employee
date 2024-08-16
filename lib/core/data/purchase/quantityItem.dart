// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuantityItem {
  int id;
  num? quantity;
  QuantityItem({
    required this.id,
    this.quantity,
  });

  QuantityItem copyWith({
    int? id,
    num? quantity,
  }) {
    return QuantityItem(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
    };
  }

  factory QuantityItem.fromMap(Map<String, dynamic> map) {
    return QuantityItem(
      id: map['id'] as int,
      quantity: map['quantity'] != null ? map['quantity'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuantityItem.fromJson(String source) => QuantityItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuantityItem(id: $id, quantity: $quantity)';

  @override
  bool operator ==(covariant QuantityItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.quantity == quantity;
  }

  @override
  int get hashCode => id.hashCode ^ quantity.hashCode;
}

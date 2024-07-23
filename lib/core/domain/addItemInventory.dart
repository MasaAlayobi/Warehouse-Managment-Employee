// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class addItemInventory {
  int warehouse_id;
  String SKU;
  String name;
  num sell_price;
  num pur_price;
  num size_cubic_meters;
  num weight;
  num start_price;
  num total_quantity;
  num min_quantity;
  num available_quantity;
  num real_quantity;
  String unit;
  addItemInventory({
    required this.warehouse_id,
    required this.SKU,
    required this.name,
    required this.sell_price,
    required this.pur_price,
    required this.size_cubic_meters,
    required this.weight,
    required this.start_price,
    required this.total_quantity,
    required this.min_quantity,
    required this.available_quantity,
    required this.real_quantity,
    required this.unit,
  });

  addItemInventory copyWith({
    int? warehouse_id,
    String? SKU,
    String? name,
    num? sell_price,
    num? pur_price,
    num? size_cubic_meters,
    num? weight,
    num? start_price,
    num? total_quantity,
    num? min_quantity,
    num? available_quantity,
    num? real_quantity,
    String? unit,
  }) {
    return addItemInventory(
      warehouse_id: warehouse_id ?? this.warehouse_id,
      SKU: SKU ?? this.SKU,
      name: name ?? this.name,
      sell_price: sell_price ?? this.sell_price,
      pur_price: pur_price ?? this.pur_price,
      size_cubic_meters: size_cubic_meters ?? this.size_cubic_meters,
      weight: weight ?? this.weight,
      start_price: start_price ?? this.start_price,
      total_quantity: total_quantity ?? this.total_quantity,
      min_quantity: min_quantity ?? this.min_quantity,
      available_quantity: available_quantity ?? this.available_quantity,
      real_quantity: real_quantity ?? this.real_quantity,
      unit: unit ?? this.unit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'warehouse_id': warehouse_id,
      'SKU': SKU,
      'name': name,
      'sell_price': sell_price,
      'pur_price': pur_price,
      'size_cubic_meters': size_cubic_meters,
      'weight': weight,
      'start_price': start_price,
      'total_quantity': total_quantity,
      'min_quantity': min_quantity,
      'available_quantity': available_quantity,
      'real_quantity': real_quantity,
      'unit': unit,
    };
  }

  factory addItemInventory.fromMap(Map<String, dynamic> map) {
    return addItemInventory(
      warehouse_id: map['warehouse_id'] as int,
      SKU: map['SKU'] as String,
      name: map['name'] as String,
      sell_price: map['sell_price'] as num,
      pur_price: map['pur_price'] as num,
      size_cubic_meters: map['size_cubic_meters'] as num,
      weight: map['weight'] as num,
      start_price: map['start_price'] as num,
      total_quantity: map['total_quantity'] as num,
      min_quantity: map['min_quantity'] as num,
      available_quantity: map['available_quantity'] as num,
      real_quantity: map['real_quantity'] as num,
      unit: map['unit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory addItemInventory.fromJson(String source) =>
      addItemInventory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'addItemInventory(warehouse_id: $warehouse_id, SKU: $SKU, name: $name, sell_price: $sell_price, pur_price: $pur_price, size_cubic_meters: $size_cubic_meters, weight: $weight, start_price: $start_price, total_quantity: $total_quantity, min_quantity: $min_quantity, available_quantity: $available_quantity, real_quantity: $real_quantity, unit: $unit)';
  }

  @override
  bool operator ==(covariant addItemInventory other) {
    if (identical(this, other)) return true;

    return other.warehouse_id == warehouse_id &&
        other.SKU == SKU &&
        other.name == name &&
        other.sell_price == sell_price &&
        other.pur_price == pur_price &&
        other.size_cubic_meters == size_cubic_meters &&
        other.weight == weight &&
        other.start_price == start_price &&
        other.total_quantity == total_quantity &&
        other.min_quantity == min_quantity &&
        other.available_quantity == available_quantity &&
        other.real_quantity == real_quantity &&
        other.unit == unit;
  }

  @override
  int get hashCode {
    return warehouse_id.hashCode ^
        SKU.hashCode ^
        name.hashCode ^
        sell_price.hashCode ^
        pur_price.hashCode ^
        size_cubic_meters.hashCode ^
        weight.hashCode ^
        start_price.hashCode ^
        total_quantity.hashCode ^
        min_quantity.hashCode ^
        available_quantity.hashCode ^
        real_quantity.hashCode ^
        unit.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WarehouseproductModel {
  int? id;
  String? SKU;
  String? name;
  String? sell_price;
  String? pur_price;
  String? size_cubic_meters;
  String? weight;
  String? str_price;
  int? total_qty;
  String? photo;
  String? unit;
  num? available_qty;
  num? min_qty;
  num? real_qty;
  WarehouseproductModel({
    this.id,
    this.SKU,
    this.name,
    this.sell_price,
    this.pur_price,
    this.size_cubic_meters,
    this.weight,
    this.str_price,
    this.total_qty,
    this.photo,
    this.unit,
    this.available_qty,
    this.min_qty,
    this.real_qty,
  });

  WarehouseproductModel copyWith({
    int? id,
    String? SKU,
    String? name,
    String? sell_price,
    String? pur_price,
    String? size_cubic_meters,
    String? weight,
    String? str_price,
    int? total_qty,
    String? photo,
    String? unit,
    num? available_qty,
    num? min_qty,
    num? real_qty,
  }) {
    return WarehouseproductModel(
      id: id ?? this.id,
      SKU: SKU ?? this.SKU,
      name: name ?? this.name,
      sell_price: sell_price ?? this.sell_price,
      pur_price: pur_price ?? this.pur_price,
      size_cubic_meters: size_cubic_meters ?? this.size_cubic_meters,
      weight: weight ?? this.weight,
      str_price: str_price ?? this.str_price,
      total_qty: total_qty ?? this.total_qty,
      photo: photo ?? this.photo,
      unit: unit ?? this.unit,
      available_qty: available_qty ?? this.available_qty,
      min_qty: min_qty ?? this.min_qty,
      real_qty: real_qty ?? this.real_qty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'SKU': SKU,
      'name': name,
      'sell_price': sell_price,
      'pur_price': pur_price,
      'size_cubic_meters': size_cubic_meters,
      'weight': weight,
      'str_price': str_price,
      'total_qty': total_qty,
      'photo': photo,
      'unit': unit,
      'available_qty': available_qty,
      'min_qty': min_qty,
      'real_qty': real_qty,
    };
  }

  factory WarehouseproductModel.fromMap(Map<String, dynamic> map) {
    return WarehouseproductModel(
      id: map['id'] != null ? map['id'] as int : null,
      SKU: map['SKU'] != null ? map['SKU'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      sell_price: map['sell_price'] != null ? map['sell_price'] as String : null,
      pur_price: map['pur_price'] != null ? map['pur_price'] as String : null,
      size_cubic_meters: map['size_cubic_meters'] != null ? map['size_cubic_meters'] as String : null,
      weight: map['weight'] != null ? map['weight'] as String : null,
      str_price: map['str_price'] != null ? map['str_price'] as String : null,
      total_qty: map['total_qty'] != null ? map['total_qty'] as int : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
      unit: map['unit'] != null ? map['unit'] as String : null,
      available_qty: map['available_qty'] != null ? map['available_qty'] as num : null,
      min_qty: map['min_qty'] != null ? map['min_qty'] as num : null,
      real_qty: map['real_qty'] != null ? map['real_qty'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WarehouseproductModel.fromJson(String source) => WarehouseproductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WarehouseproductModel(id: $id, SKU: $SKU, name: $name, sell_price: $sell_price, pur_price: $pur_price, size_cubic_meters: $size_cubic_meters, weight: $weight, str_price: $str_price, total_qty: $total_qty, photo: $photo, unit: $unit, available_qty: $available_qty, min_qty: $min_qty, real_qty: $real_qty)';
  }

  @override
  bool operator ==(covariant WarehouseproductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.SKU == SKU &&
      other.name == name &&
      other.sell_price == sell_price &&
      other.pur_price == pur_price &&
      other.size_cubic_meters == size_cubic_meters &&
      other.weight == weight &&
      other.str_price == str_price &&
      other.total_qty == total_qty &&
      other.photo == photo &&
      other.unit == unit &&
      other.available_qty == available_qty &&
      other.min_qty == min_qty &&
      other.real_qty == real_qty;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      SKU.hashCode ^
      name.hashCode ^
      sell_price.hashCode ^
      pur_price.hashCode ^
      size_cubic_meters.hashCode ^
      weight.hashCode ^
      str_price.hashCode ^
      total_qty.hashCode ^
      photo.hashCode ^
      unit.hashCode ^
      available_qty.hashCode ^
      min_qty.hashCode ^
      real_qty.hashCode;
  }
}

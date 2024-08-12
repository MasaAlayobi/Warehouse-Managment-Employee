// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemInStripped {
  int id;
  String? SKU;
  String? name;
  String? sell_price;
  String? pur_price;
  String? size_cubic_meters;
  String? weight;
  String? str_price;
  num? total_qty;
  String? photo;
  String? unit;
  ItemInStripped({
    required this.id,
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
  });

  ItemInStripped copyWith({
    int? id,
    String? SKU,
    String? name,
    String? sell_price,
    String? pur_price,
    String? size_cubic_meters,
    String? weight,
    String? str_price,
    num? total_qty,
    String? photo,
    String? unit,
  }) {
    return ItemInStripped(
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
    };
  }

  factory ItemInStripped.fromMap(Map<String, dynamic> map) {
    return ItemInStripped(
      id: map['id'] as int,
      SKU: map['SKU'] != null ? map['SKU'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      sell_price: map['sell_price'] != null ? map['sell_price'] as String : null,
      pur_price: map['pur_price'] != null ? map['pur_price'] as String : null,
      size_cubic_meters: map['size_cubic_meters'] != null ? map['size_cubic_meters'] as String : null,
      weight: map['weight'] != null ? map['weight'] as String : null,
      str_price: map['str_price'] != null ? map['str_price'] as String : null,
      total_qty: map['total_qty'] != null ? map['total_qty'] as num : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
      unit: map['unit'] != null ? map['unit'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemInStripped.fromJson(String source) => ItemInStripped.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemInStripped(id: $id, SKU: $SKU, name: $name, sell_price: $sell_price, pur_price: $pur_price, size_cubic_meters: $size_cubic_meters, weight: $weight, str_price: $str_price, total_qty: $total_qty, photo: $photo, unit: $unit)';
  }

  @override
  bool operator ==(covariant ItemInStripped other) {
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
      other.unit == unit;
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
      unit.hashCode;
  }
}

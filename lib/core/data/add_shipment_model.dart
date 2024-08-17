// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddShipmentModel {
  int employee_id;
  int vehicle_id;
  int warehouse_id;
  AddShipmentModel({
    required this.employee_id,
    required this.vehicle_id,
    required this.warehouse_id,
  });

  AddShipmentModel copyWith({
    int? employee_id,
    int? vehicle_id,
    int? warehouse_id,
  }) {
    return AddShipmentModel(
      employee_id: employee_id ?? this.employee_id,
      vehicle_id: vehicle_id ?? this.vehicle_id,
      warehouse_id: warehouse_id ?? this.warehouse_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employee_id': employee_id,
      'vehicle_id': vehicle_id,
      'warehouse_id': warehouse_id,
    };
  }

  factory AddShipmentModel.fromMap(Map<String, dynamic> map) {
    return AddShipmentModel(
      employee_id: map['employee_id'] as int,
      vehicle_id: map['vehicle_id'] as int,
      warehouse_id: map['warehouse_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddShipmentModel.fromJson(String source) => AddShipmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddShipmentModel(employee_id: $employee_id, vehicle_id: $vehicle_id, warehouse_id: $warehouse_id)';

  @override
  bool operator ==(covariant AddShipmentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.employee_id == employee_id &&
      other.vehicle_id == vehicle_id &&
      other.warehouse_id == warehouse_id;
  }

  @override
  int get hashCode => employee_id.hashCode ^ vehicle_id.hashCode ^ warehouse_id.hashCode;
}

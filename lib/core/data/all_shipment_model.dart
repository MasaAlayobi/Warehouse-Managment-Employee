// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AllShipmentModel {
 int id;
 String tracking_number;
 String current_capacity;
 String status; 
  AllShipmentModel({
    required this.id,
    required this.tracking_number,
    required this.current_capacity,
    required this.status,
  });

  AllShipmentModel copyWith({
    int? id,
    String? tracking_number,
    String? current_capacity,
    String? status,
  }) {
    return AllShipmentModel(
      id: id ?? this.id,
      tracking_number: tracking_number ?? this.tracking_number,
      current_capacity: current_capacity ?? this.current_capacity,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tracking_number': tracking_number,
      'current_capacity': current_capacity,
      'status': status,
    };
  }

  factory AllShipmentModel.fromMap(Map<dynamic, dynamic> map) {
    return AllShipmentModel(
      id: map['id'] as int,
      tracking_number: map['tracking_number'] as String,
      current_capacity: map['current_capacity'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllShipmentModel.fromJson(String source) => AllShipmentModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() {
    return 'AllShipmentModel(id: $id, tracking_number: $tracking_number, current_capacity: $current_capacity, status: $status)';
  }

  @override
  bool operator ==(covariant AllShipmentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.tracking_number == tracking_number &&
      other.current_capacity == current_capacity &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      tracking_number.hashCode ^
      current_capacity.hashCode ^
      status.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PreviousSaleOrderModel {
  int id;
  String? status;
  PreviousSaleOrderModel({
    required this.id,
    this.status,
  });

  PreviousSaleOrderModel copyWith({
    int? id,
    String? status,
  }) {
    return PreviousSaleOrderModel(
      id: id ?? this.id,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
    };
  }

  factory PreviousSaleOrderModel.fromMap(Map<String, dynamic> map) {
    return PreviousSaleOrderModel(
      id: map['id'] as int,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PreviousSaleOrderModel.fromJson(String source) => PreviousSaleOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PreviousSaleOrderModel(id: $id, status: $status)';

  @override
  bool operator ==(covariant PreviousSaleOrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ status.hashCode;
}

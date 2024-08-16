// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StatusModel {
  String status;
  StatusModel({
    required this.status,
  });

  StatusModel copyWith({
    String? status,
  }) {
    return StatusModel(
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
    };
  }

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusModel.fromJson(String source) => StatusModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StatusModel(status: $status)';

  @override
  bool operator ==(covariant StatusModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status;
  }

  @override
  int get hashCode => status.hashCode;
}

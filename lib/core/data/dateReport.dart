// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DateReportModel {
  String toDate;
  String fromDate;
  DateReportModel({
    required this.toDate,
    required this.fromDate,
  });

  DateReportModel copyWith({
    String? toDate,
    String? fromDate,
  }) {
    return DateReportModel(
      toDate: toDate ?? this.toDate,
      fromDate: fromDate ?? this.fromDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'toDate': toDate,
      'fromDate': fromDate,
    };
  }

  factory DateReportModel.fromMap(Map<String, dynamic> map) {
    return DateReportModel(
      toDate: map['toDate'] as String,
      fromDate: map['fromDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DateReportModel.fromJson(String source) =>
      DateReportModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DateReportModel(toDate: $toDate, fromDate: $fromDate)';

  @override
  bool operator ==(covariant DateReportModel other) {
    if (identical(this, other)) return true;

    return other.toDate == toDate && other.fromDate == fromDate;
  }

  @override
  int get hashCode => toDate.hashCode ^ fromDate.hashCode;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LocationModel {
  String? country;
  String? city;
  String? region;
  LocationModel({
    this.country,
    this.city,
    this.region,
  });

  LocationModel copyWith({
    String? country,
    String? city,
    String? region,
  }) {
    return LocationModel(
      country: country ?? this.country,
      city: city ?? this.city,
      region: region ?? this.region,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'city': city,
      'region': region,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      country: map['country'] != null ? map['country'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      region: map['region'] != null ? map['region'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) => LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LocationModel(country: $country, city: $city, region: $region)';

  @override
  bool operator ==(covariant LocationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.country == country &&
      other.city == city &&
      other.region == region;
  }

  @override
  int get hashCode => country.hashCode ^ city.hashCode ^ region.hashCode;
}

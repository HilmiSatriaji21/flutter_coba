import 'package:flutter/foundation.dart';

class Post {
  final String countryRegion;
  final int confirmed;
  final int deaths;
  final int recovered;
  final int active;

  Post({
    @required this.countryRegion,
    @required this.confirmed,
    @required this.deaths,
    @required this.recovered,
    @required this.active,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      countryRegion: json['attributes']['Country_Region'] as String,
      confirmed: json['attributes']['Confirmed'] as int,
      deaths: json['attributes']['Deaths'] as int,
      recovered: json['attributes']['Recovered'] as int,
      active: json['attributes']['Active'] as int,
    );
  }
}
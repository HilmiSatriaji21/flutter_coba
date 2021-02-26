import 'package:flutter/foundation.dart';

class Post {
  final int kode_provi;
  final String provinsi;
  final int kasus_posi;
  final int kasus_semb;
  final int kasus_meni;

  Post({
    @required this.kode_provi,
    @required this.provinsi,
    @required this.kasus_posi,
    @required this.kasus_semb,
    @required this.kasus_meni,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      kode_provi: json['attributes']['Kode_Provi'] as int,
      provinsi: json['attributes']['Provinsi'] as String,
      kasus_posi: json['attributes']['Kasus_Posi'] as int,
      kasus_semb: json['attributes']['Kasus_Semb'] as int,
      kasus_meni: json['attributes']['Kasus_Meni'] as int,
    );
  }
}
import 'dart:convert';

class Karyawan {
  String nama;
  int umur;
  Alamat alamat;
  List<String> hobi;

  Karyawan({
    required this.nama,
    required this.umur,
    required this.alamat,
    required this.hobi,
  });

  factory Karyawan.fromRawJson(String str) =>
      Karyawan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Karyawan.fromJson(Map<String, dynamic> json) => Karyawan(
        nama: json["nama"],
        umur: json["umur"],
        alamat: Alamat.fromJson(json["alamat"]),
        hobi: List<String>.from(json["hobi"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "umur": umur,
        "alamat": alamat.toJson(),
        "hobi": List<dynamic>.from(hobi.map((x) => x)),
      };
}

class Alamat {
  String jalan;
  String kota;
  String provinsi;

  Alamat({
    required this.jalan,
    required this.kota,
    required this.provinsi,
  });

  factory Alamat.fromRawJson(String str) => Alamat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Alamat.fromJson(Map<String, dynamic> json) => Alamat(
        jalan: json["jalan"],
        kota: json["kota"],
        provinsi: json["provinsi"],
      );

  Map<String, dynamic> toJson() => {
        "jalan": jalan,
        "kota": kota,
        "provinsi": provinsi,
      };
}

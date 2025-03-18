import 'imsakiyah.dart';

class Datum {
  String? provinsi;
  String? kabkota;
  String? hijriah;
  String? masehi;
  List<Imsakiyah>? imsakiyah;

  Datum({
    this.provinsi,
    this.kabkota,
    this.hijriah,
    this.masehi,
    this.imsakiyah,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        provinsi: json['provinsi'] as String?,
        kabkota: json['kabkota'] as String?,
        hijriah: json['hijriah'] as String?,
        masehi: json['masehi'] as String?,
        imsakiyah: (json['imsakiyah'] as List<dynamic>?)
            ?.map((e) => Imsakiyah.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'provinsi': provinsi,
        'kabkota': kabkota,
        'hijriah': hijriah,
        'masehi': masehi,
        'imsakiyah': imsakiyah?.map((e) => e.toJson()).toList(),
      };
}

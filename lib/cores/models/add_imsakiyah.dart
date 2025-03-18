class AddImsakiyah {
  String? kabkota;
  String? provinsi;

  AddImsakiyah({this.kabkota, this.provinsi});

  factory AddImsakiyah.fromJson(Map<String, dynamic> json) => AddImsakiyah(
        kabkota: json['kabkota'] as String?,
        provinsi: json['provinsi'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'kabkota': kabkota,
        'provinsi': provinsi,
      };
}

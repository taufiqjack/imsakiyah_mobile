class AddKabupaten {
  String? provinsi;

  AddKabupaten({this.provinsi});

  factory AddKabupaten.fromJson(Map<String, dynamic> json) => AddKabupaten(
        provinsi: json['provinsi'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'provinsi': provinsi,
      };
}

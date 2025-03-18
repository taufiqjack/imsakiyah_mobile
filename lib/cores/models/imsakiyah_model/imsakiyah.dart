class Imsakiyah {
  int? tanggal;
  String? imsak;
  String? subuh;
  String? terbit;
  String? dhuha;
  String? dzuhur;
  String? ashar;
  String? maghrib;
  String? isya;

  Imsakiyah({
    this.tanggal,
    this.imsak,
    this.subuh,
    this.terbit,
    this.dhuha,
    this.dzuhur,
    this.ashar,
    this.maghrib,
    this.isya,
  });

  factory Imsakiyah.fromJson(Map<String, dynamic> json) => Imsakiyah(
        tanggal: json['tanggal'] as int?,
        imsak: json['imsak'] as String?,
        subuh: json['subuh'] as String?,
        terbit: json['terbit'] as String?,
        dhuha: json['dhuha'] as String?,
        dzuhur: json['dzuhur'] as String?,
        ashar: json['ashar'] as String?,
        maghrib: json['maghrib'] as String?,
        isya: json['isya'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tanggal': tanggal,
        'imsak': imsak,
        'subuh': subuh,
        'terbit': terbit,
        'dhuha': dhuha,
        'dzuhur': dzuhur,
        'ashar': ashar,
        'maghrib': maghrib,
        'isya': isya,
      };
}

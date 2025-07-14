class NutritionAnalysis {
  final String makanan;
  final AnalisisNutrisi analisisNutrisi;
  final List<String> manfaat;
  final List<String> risiko;
  final List<String> cocokUntukDiet;
  final String rekomendasi;

  NutritionAnalysis({
    required this.makanan,
    required this.analisisNutrisi,
    required this.manfaat,
    required this.risiko,
    required this.cocokUntukDiet,
    required this.rekomendasi,
  });

  factory NutritionAnalysis.fromJson(Map<String, dynamic> json) {
    return NutritionAnalysis(
      makanan: json['makanan'] ?? 'Tidak teridentifikasi',
      analisisNutrisi: AnalisisNutrisi.fromJson(json['analisisNutrisi'] ?? {}),
      manfaat: List<String>.from(json['manfaat'] ?? []),
      risiko: List<String>.from(json['risiko'] ?? []),
      cocokUntukDiet: List<String>.from(json['cocokUntukDiet'] ?? []),
      rekomendasi: json['rekomendasi'] ?? 'Tidak tersedia',
    );
  }
}

class AnalisisNutrisi {
  final String kalori;
  final String karbohidrat;
  final String protein;
  final String lemak;
  final String serat;
  final List<String> vitamin;
  final List<String> mineral;

  AnalisisNutrisi({
    required this.kalori,
    required this.karbohidrat,
    required this.protein,
    required this.lemak,
    required this.serat,
    required this.vitamin,
    required this.mineral,
  });

  factory AnalisisNutrisi.fromJson(Map<String, dynamic> json) {
    return AnalisisNutrisi(
      kalori: json['kalori'] ?? 'Tidak tersedia',
      karbohidrat: json['karbohidrat'] ?? 'Tidak tersedia',
      protein: json['protein'] ?? 'Tidak tersedia',
      lemak: json['lemak'] ?? 'Tidak tersedia',
      serat: json['serat'] ?? 'Tidak tersedia',
      vitamin: List<String>.from(json['vitamin'] ?? []),
      mineral: List<String>.from(json['mineral'] ?? []),
    );
  }
}
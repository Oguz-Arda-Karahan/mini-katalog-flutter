
class Urun {
  String isim;
  double fiyat;
  String resim;
  String aciklama;
  
  Urun({
    required this.isim,
    required this.fiyat,
    required this.resim,
    required this.aciklama,
  });
  
  factory Urun.jsonOlustur(Map<String, dynamic> json) {
    return Urun(
      isim: json['name'] ?? 'Ürün',
      fiyat: (json['price'] ?? 0).toDouble(),
      resim: json['image'] ?? '',
      aciklama: json['description'] ?? 'Açıklama yok',
    );
  }
}

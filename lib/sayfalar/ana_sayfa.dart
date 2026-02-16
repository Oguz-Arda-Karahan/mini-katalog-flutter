import 'package:flutter/material.dart';
import '../modeller/urun.dart';
import 'urun_detay_sayfa.dart';
import 'sepet_sayfa.dart';

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<Urun> urunler = [
    Urun(
      isim: 'Kablosuz Kulaklık',
      fiyat: 2499,
      resim: 'https://images.unsplash.com/photo-1606841837239-c5a1a4a07af7?w=400',
      aciklama: 'Aktif gürültü önleme özellikli kablosuz kulaklık. Uzun pil ömrü ve üstün ses kalitesi.',
    ),
    Urun(
      isim: 'Kulaküstü Kulaklık',
      fiyat: 5499,
      resim: 'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=400',
      aciklama: 'Premium ses kalitesi sunan kulaküstü kulaklık. Profesyonel stüdyo kalitesinde ses.',
    ),
    Urun(
      isim: 'Akıllı Hoparlör',
      fiyat: 2999,
      resim: 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400',
      aciklama: 'Akıllı hoparlör sistemi. Evinizi müzikle doldurun, sesli komutlarla kontrol edin.',
    ),
    Urun(
      isim: 'Mini Akıllı Hoparlör',
      fiyat: 999,
      resim: 'https://www.apple.com/tr/newsroom/2020/10/apple-introduces-homepod-mini-a-powerful-smart-speaker-with-amazing-sound/',
      aciklama: 'Kompakt ve güçlü akıllı hoparlör. Küçük boyutta büyük ses.',
    ),
    Urun(
      isim: 'Akıllı Telefon',
      fiyat: 29999,
      resim: 'https://images.unsplash.com/photo-1592286927505-b0501ae8dc39?w=400',
      aciklama: 'En yeni nesil akıllı telefon. Profesyonel kamera sistemi ve güçlü işlemci.',
    ),
    Urun(
      isim: 'Dizüstü Bilgisayar 14"',
      fiyat: 49999,
      resim: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
      aciklama: 'Profesyonel dizüstü bilgisayar. Yüksek performans ve uzun pil ömrü.',
    ),
    Urun(
      isim: 'iPad Air',
      fiyat: 15999,
      resim: 'https://images.unsplash.com/photo-1561154464-82e9adf32764?w=400',
      aciklama: 'Hafif ve güçlü tablet. Çizim, okuma ve eğlence için mükemmel.',
    ),
  ];

  int sepetAdet = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Keşfet',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Mükemmel cihazını bul',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SepetSayfa(sepetAdet: sepetAdet),
                    ),
                  );
                },
              ),
              if (sepetAdet > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$sepetAdet',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ürünlerde ara',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          
          Container(
            margin: EdgeInsets.all(16),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.purple.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                'Özel İndirimler',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: urunler.length,
              itemBuilder: (context, index) {
                Urun urun = urunler[index];
                return urunKarti(urun);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget urunKarti(Urun urun) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UrunDetaySayfa(
              urun: urun,
              sepeteEkle: () {
                setState(() {
                  sepetAdet++;
                });
              },
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Image.network(
                    urun.resim,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.image, size: 50, color: Colors.grey);
                    },
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    urun.isim,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${urun.fiyat.toInt()}₺',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

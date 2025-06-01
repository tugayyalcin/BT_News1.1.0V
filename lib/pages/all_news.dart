import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Ağa bağlı resimleri önbelleğe almak için gerekli paket
import '../models/article_model.dart'; // ArticleModel modelini import ediyoruz
import '../pages/article_view.dart'; // ArticleView sayfasını import ediyoruz

class AllNews extends StatelessWidget {
  // Tüm haberlerin bulunduğu listeyi alacak olan constructor
  final List<ArticleModel> articles;

  const AllNews({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All News", // Uygulamanın üst kısmındaki başlık
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white, // AppBar arka plan rengini beyaz yapıyoruz
        iconTheme: const IconThemeData(color: Colors.black), // AppBar'daki ikonların rengini siyah yapıyoruz
        elevation: 0, // AppBar'ın gölgesini kaldırıyoruz
      ),
      body: ListView.builder(
        // Listeyi dinamik olarak oluşturmak için ListView kullanıyoruz
        itemCount: articles.length, // Liste elemanlarının sayısı kadar item render edilir
        itemBuilder: (context, index) {
          final article = articles[index]; // Her bir haber için ArticleModel alıyoruz
          
          return GestureDetector(
            // Liste öğesine tıklanabilirlik eklemek için GestureDetector kullanıyoruz
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleView(blogUrl: article.url ?? ""),
                  // Tıklanan haberin detay sayfasına gitmek için ArticleView yönlendirmesi yapılır
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Kartın çevresine boşluk bırakıyoruz
              elevation: 2, // Kartın gölgesi
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Kart köşelerini yuvarlatıyoruz
              ),
              child: Row(
                children: [
                  ClipRRect(
                    // Resmi köşelerinden yuvarlamak için ClipRRect kullanıyoruz
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: article.urlToImage ?? "", // Resmin URL'si
                      height: 100, // Resmin yüksekliği
                      width: 100, // Resmin genişliği
                      fit: BoxFit.cover, // Resmin içeriği sarmasını sağlıyoruz
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(), 
                      // Resim yüklenene kadar gösterilecek animasyon
                      errorWidget: (context, url, error) => Image.asset(
                        "images/placeholder.jpg", // Resim hatası durumunda gösterilecek yedek resim
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Resim ile metin arasına boşluk ekliyoruz
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0), // İçeriğin etrafına padding ekliyoruz
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        // Metni sola yaslıyoruz
                        children: [
                          Text(
                            article.title ?? "", 
                            // Başlık metni
                            style: const TextStyle(
                              fontSize: 16, 
                              fontWeight: FontWeight.bold, // Başlık stilini belirliyoruz
                            ),
                            maxLines: 2, // Başlık bir satıra sığmazsa iki satıra sığacak şekilde ayarlanır
                            overflow: TextOverflow.ellipsis, // Başlık sığmazsa üç nokta gösterilir
                          ),
                          const SizedBox(height: 6), // Başlık ile açıklama arasına boşluk ekliyoruz
                          Text(
                            article.description ?? "",
                            style: const TextStyle(fontSize: 14), // Açıklama stilini belirliyoruz
                            maxLines: 2, // Açıklama bir satıra sığmazsa iki satıra sığacak şekilde ayarlanır
                            overflow: TextOverflow.ellipsis, // Açıklama sığmazsa üç nokta gösterilir
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

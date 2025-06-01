import 'dart:convert'; // JSON verisini işlemek için kullanılan paket

import 'package:bt_news/models/article_model.dart'; // ArticleModel sınıfını import ediyoruz
import 'package:http/http.dart' as http; // HTTP istekleri yapmak için http paketini import ediyoruz

// Haberleri yöneten sınıf
class News {
  List<ArticleModel> news = [];
  // Haberleri çekmek için asenkron bir fonksiyon
  Future<void> getNews() async {
    // Api tarihi dinamik olarak oluştur (30 gün önce)
    DateTime now = DateTime.now();
    DateTime thirtyDaysAgo = now.subtract(Duration(days: 30));
    String formattedDate = "${thirtyDaysAgo.year}-${thirtyDaysAgo.month.toString().padLeft(2, '0')}-${thirtyDaysAgo.day.toString().padLeft(2, '0')}";
    
    // News API'den veri çekeceğimiz URL'yi oluşturuyoruz
    String url = "https://newsapi.org/v2/everything?q=tesla&from=$formattedDate&sortBy=publishedAt&apiKey=8ca749c4e11d4b70a9562dc36918717a";

    // HTTP GET isteği gönderiyoruz
    var response = await http.get(Uri.parse(url));
    
    // JSON yanıtını çözümleyerek verileri alıyoruz
    var jsonData = jsonDecode(response.body);
    
    // Eğer API cevabı "ok" ise, yani veri düzgün geldiyse
    if (jsonData['status'] == 'ok') {
      // API cevabındaki "articles" verisini döngüye alıyoruz
      jsonData["articles"].forEach((element) {
        // Görsel (urlToImage) ve açıklama (description) varsa, veri geçerli kabul ediliyor
        if (element["urlToImage"] != null && element['description'] != null) {
          // ArticleModel nesnesi oluşturuyoruz ve veriyi bu nesneye ekliyoruz
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          // Oluşturduğumuz makale nesnesini listeye ekliyoruz
          news.add(articleModel);
        }
      });
    }
  }
}
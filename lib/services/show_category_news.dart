import 'dart:convert'; // JSON verilerini işlemek için kullanılan paket
import 'package:bt_news/models/show_category.dart'; // ShowCategoryModel sınıfını import ediyoruz
import 'package:bt_news/models/slider_model.dart'; // SliderModel sınıfını import ediyoruz
import 'package:http/http.dart' as http; // HTTP istekleri yapmak için http paketini import ediyoruz

// Kategori haberlerini yöneten sınıf
class ShowCategoryNews{
  // Kategoriler için haberleri tutacak liste
  List<ShowCategoryModel>categories=[];
  // Kategoriye ait haberleri çekmek için asenkron fonksiyon
  Future<void>getCategoriesNews(String  category)async{
    // API'ye yapılacak istek için URL oluşturuluyor. 'category' parametresi dinamik olarak ekleniyor.
    String url="https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=8ca749c4e11d4b70a9562dc36918717a";

    // HTTP GET isteği gönderiyoruz
    var response=await http.get(Uri.parse(url));

    // JSON yanıtını çözümleyerek verileri alıyoruz
    var jsonData=jsonDecode(response.body);
    
    // Eğer API cevabı "ok" ise, yani veri düzgün geldiyse
    if(jsonData['status']=='ok'){
      // API cevabındaki "articles" verisini döngüye alıyoruz
      jsonData["articles"].forEach((element){
         // Görsel (urlToImage) ve açıklama (description) varsa, veri geçerli kabul ediliyor
        if(element["urlToImage"]!=null && element['description']!=null){
          // ShowCategoryModel nesnesi oluşturuluyor ve veriyi bu nesneye ekliyoruz
          ShowCategoryModel categoryModel =ShowCategoryModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
           // Oluşturduğumuz kategori nesnesini listeye ekliyoruz
          categories.add(categoryModel);
        }
      });
    }
  }
}
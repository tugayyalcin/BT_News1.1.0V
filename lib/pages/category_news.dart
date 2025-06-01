import 'package:bt_news/models/show_category.dart';
import 'package:bt_news/pages/article_view.dart';
import 'package:bt_news/services/show_category_news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class CategoryNews extends StatefulWidget {
String name;
CategoryNews({required this.name});


  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel>categories=[];
  bool _loading=true;

@override
  void initState() {

    super.initState();
    getNews(); // Kategorilere ait haberleri almak için getNews() fonksiyonunu çağırıyoruz
  }

  getNews() async {
     ShowCategoryNews showCategoryNews = ShowCategoryNews(); 
     // ShowCategoryNews sınıfından bir nesne oluşturuluyor
    await showCategoryNews.getCategoriesNews(widget.name.toLowerCase()); 
    // Kategoriye göre haberler çekiliyor
    categories = showCategoryNews.categories; 
    // Çekilen haberler categories listesine atanıyor
    setState(() {
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:


            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),


        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body:Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            shrinkWrap: true, // Yalnızca ihtiyaç duyulan alanı kaplamasını sağlar
          physics: ClampingScrollPhysics(), // Scroll hareketini optimize eder
          itemCount: categories.length, // Listede kaç öğe varsa o kadar item gösterilir
          itemBuilder: (context,index){
              return ShowCategory(
               Image: categories[index].urlToImage!, // Resim URL'si
              desc: categories[index].description!, // Açıklama
              title: categories[index].title!, // Başlık
              url: categories[index].url!, // Makale URL'si

              );

          },
        ),
      )



    );
  }
}
class ShowCategory extends StatelessWidget {
  String Image,desc,title,url;
  ShowCategory({required this.Image,required this.title,required this.desc,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Haber başlığına tıklanınca ArticleView sayfasına yönlendirme yapılır
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(blogUrl: url)));
      },
      child: Container(
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: Image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5.0,),
          Text(
            title,
            maxLines: 2,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
            ),
          ),
          Text(desc,maxLines: 3,),
          SizedBox(height: 20.0,)
        ],),
      ),
    );
  }
}


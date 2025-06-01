import 'package:bt_news/models/article_model.dart';
import 'package:bt_news/pages/article_view.dart';
import 'package:bt_news/pages/category_news.dart';
import 'package:bt_news/pages/all_news.dart'; // Yeni sayfa import edildi
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:bt_news/models/category_model.dart';
import 'package:bt_news/services/data.dart';
import '../services/news.dart';
import 'package:bt_news/pages/login.dart';


// Ana sayfa (Home) ekranı, kullanıcıya kategori bazlı haberler ve en son haberleri gösterir
// Ayrıca kullanıcı, her habere tıklayarak detayları görüntüleyebilir
// Kategoriler, dönen slider ve trending news gibi bölümlerle haberler kullanıcıya sunulur
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];  // Kategoriler
  List<ArticleModel> articles = [];  // Haberler
  bool _loading = true;  // Yükleniyor durumu
  int activeIndex = 0;  // Carousel slider için aktif index

  @override
  void initState() {
    categories = getCategories();  // Kategorileri al
    getNews();  // Haberleri al
    super.initState();
  }

  // Haberleri almak için kullanılan fonksiyon
  getNews() async {
    News newsclass = News();  // News sınıfını başlat
    await newsclass.getNews();  // Haberleri al
    articles = newsclass.news;  // Haberleri articles listesine ata
    setState(() {
      _loading = false; // Yükleme tamamlandığında setState çağır
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("BT", style: TextStyle(color: Colors.black)),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),

      drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
  decoration: const BoxDecoration(color: Colors.blue),
  child: Center(
    child: Image.network(
      'https://pbs.twimg.com/profile_images/1347941491889549318/uvn8isXg_400x400.jpg',
      fit: BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const CircularProgressIndicator();
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error); // Eğer resim gelmezse hata simgesi göster
      },
    ),
  ),
),
// Çıkış yapma butonu
        ListTile(
          leading: Icon(Icons.logout_rounded),
          title: Text('Log Out'),
          onTap: () {
            Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const Login(), // Çıkış yaptıktan sonra Login sayfasına yönlendir
  ),
);
          },
        ),
        // Tüm haberler sayfasına yönlendirme
        ListTile(
          leading: Icon(Icons.article),
          title: Text('All News'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllNews(articles: articles)), 
              // AllNews sayfasına yönlendir
            );
          },
        ),
      ],
    ),
  ),


      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories
            Container(
              margin: const EdgeInsets.only(left: 10.0, top: 10.0),
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    image: categories[index].image, // Kategori resmini ve ismini göster
                    categoryName: categories[index].categoryName,
                  );
                },
              ),
            ),

            const SizedBox(height: 20.0),

            // Breaking News başlığı ve "View All" linki
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Breaking News!",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AllNews(articles: articles), // Tüm haberleri göster
                        ),
                      );
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10.0),

            // CarouselSlider - Kaydırmalı haber görüntüleme
            CarouselSlider.builder(
              itemCount: articles.take(10).length, // İlk 10 haber
              itemBuilder: (context, index, realIndex) {
                String imageUrl = articles[index].urlToImage ?? "";
                String title = articles[index].title ?? "";
                String blogUrl = articles[index].url ?? "";

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleView(blogUrl: blogUrl), 
                        // Habere tıklanarak detaylar gösterilir
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl.isNotEmpty
                                ? imageUrl
                                : "https://via.placeholder.com/300", // Placeholder image
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Image.asset(
                              "images/placeholder.jpg",
                              fit: BoxFit.cover,
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            decoration: const BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),

            const SizedBox(height: 10.0),
            // CarouselSlider index göstergesi
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: articles.length > 10 ? 10 : articles.length,
                effect: SlideEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  activeDotColor: Colors.blue,
                  dotColor: Colors.grey.shade400,
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            // Trending News başlığı
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Trending News!",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10.0),
            // Trend haberler listesi
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return BlogTile(
                  url: articles[index].url ?? "",
                  desc: articles[index].description ?? "",
                  imageUrl: articles[index].urlToImage ?? "",
                  title: articles[index].title ?? "",
                );
              },
            ),

            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
//Kategori Kartı Widget'i
class CategoryTile extends StatelessWidget {
  final String? image;
  final String? categoryName;

  const CategoryTile({
    required this.categoryName,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CategoryNews(name: categoryName ?? "General"), // Kategoriye tıklanarak haberleri göster
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image ?? "images/placeholder.jpg", // Kategoriye ait resim
                width: 120,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black38,
              ),
              child: Center(
                child: Text(
                  categoryName ?? "Category", // Kategori ismini yaz
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// Blog kartı widget'i
class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;

  const BlogTile({
    required this.desc,
    required this.imageUrl,
    required this.title,
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)), 
          // Habere tıklanarak detayları göster
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl.isNotEmpty
                          ? imageUrl
                          : "https://via.placeholder.com/150", // Placeholder image
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Image.asset(
                        "images/placeholder.jpg", // Hata durumunda resim göster
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          desc,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// API'den çekilen haber makalesinin modelini temsil eden sınıf
class ArticleModel{

String? author; // Makale yazarının adı
String? title; // Makale başlığı
String? description;  // Makale açıklaması
String? url;  // Makalenin tam metnine yönlendiren URL
String? urlToImage; // Makaleye ait görselin URL'si
String? content; // Makalenin içeriği

ArticleModel({this.author,this.content,this.description,this.title,this.url,this.urlToImage});
}
# 📰 Mobil Uygulama Geliştirme - BTNews (API Kullanarak Haber Uygulaması)

# 🎯 Proje Amacı

Bu proje, mobil uygulama geliştirme dersi kapsamında kullanıcıların güncel haberlere ulaşabileceği bir mobil uygulama geliştirmek amacıyla yapılmıştır. Uygulama içerisinde kullanılan veriler bir haber API’sinden çekilmekte olup, haber başlıkları ve görseller dinamik olarak görüntülenmektedir. Kullanıcı bir habere tıkladığında, doğrudan haberin yayınlandığı **orijinal web sitesine** yönlendirilir.

---

# ⚙️ Teknik Detaylar ve Öne Çıkan Özellikler

- Flutter SDK ile geliştirilmiştir.
- Haberler ve görseller **NewsAPI** üzerinden çekilmektedir.
- Giriş sistemi için **Firebase Authentication** kullanılmıştır.
- Drawer menü kullanılarak uygulama içinde kolay gezinme sağlanmıştır.
- Dinamik API verisi ile sürekli güncellenen içerik yapısı mevcuttur.
- Kullanıcılar haber detayına tıklayarak orijinal kaynağa yönlendirilir.
- Responsive tasarımı sayesinde tüm cihaz boyutlarında uyumlu çalışır.
  
---

# 📄 Uygulama Sayfaları ve Görevleri
### 1. **LandingPage Sayfası**

- **Görev**: Kullanıcıyı karşılayan açılış sayfasıdır. Bu sayfa, kullanıcının uygulamaya giriş yapmadan önce gördüğü ilk ekran olup, uygulamanın amacını ve içeriğini tanıtır.
  
- **İçerikler**:
  - **Görsel Başlık**: Sayfada büyük bir başlık yer alır: `"News from around the world for you"`. Bu başlık, kullanıcılara dünya çapındaki haberleri sunduğumuzu vurgular.
  - **Açıklama Metni**: Başlığın altında, `"Best time to read, take your time to read a little more of this world"` şeklinde bir açıklama metni bulunur. Bu metin, kullanıcıyı haber okumaya teşvik eder.
  - **Ana Sayfaya Yönlendiren Buton**: Kullanıcıyı uygulamanın ana sayfasına yönlendiren "Get Started" butonu bulunur. Bu butona tıklayarak kullanıcı, uygulamanın ana sayfasına geçiş yapar.
  - **Navigasyon**: Butona tıklanıldığında, kullanıcıyı `Home` sayfasına yönlendiren bir yönlendirme yapılır. `Navigator.push` kullanılarak geçiş sağlanır.

- **Tasarım**:
  - Sayfa, görsel bir öğe (binanın fotoğrafı) ile başlar ve kullanıcıyı uygulamanın ne sunduğunu anlatan açıklamalarla devam eder.
  - Buton, mavi renk ile dikkat çekici hale getirilmiş ve yuvarlatılmış köşelere sahip bir şekilde tasarlanmıştır.
  - `GestureDetector` widget'ı ile buton tıklanabilir hale getirilmiş, kullanıcı etkileşime girebilir.

- **Kullanılan Widget'lar**:
  - `Scaffold`: Temel yapı için kullanılır.
  - `Column`: Dikey düzen için kullanılır.
  - `Material`: Butonun stilini ve gölgelendirmesini sağlamak için kullanılır.
  - `GestureDetector`: Buton tıklanabilir hale getirilir.
  - `SizedBox`: Öğeler arasına boşluk eklemek için kullanılır.
  - `Image.asset`: Uygulama görseli ekler.

Bu sayfa, kullanıcıyı uygulamaya davet eden ve onları ana sayfaya yönlendiren basit ancak etkili bir açılış ekranıdır.

  
![Image](https://github.com/user-attachments/assets/e3daa07b-d195-418a-aa26-15c439f37d85)

### 2. **Login Sayfası**

- **Görev**: Kullanıcıların e-posta ve şifre ile giriş yapmasını sağlar. 
  - Başarılı giriş yapıldığında, kullanıcıyı **LandingPage** sayfasına yönlendirir.
  - Hatalı giriş yapılması durumunda, Firebase Authentication tarafından sağlanan hata mesajlarını gösterir.
  - Kullanıcı, şifresini unuttuğunda, "Forgot Password?" linki ile şifre sıfırlama sayfasına yönlendirilebilir.
  - Henüz hesabı olmayan kullanıcılar, "Register Now" butonuna tıklayarak kayıt olma sayfasına yönlendirilir.

- **İçerikler**:
  - **Başlık**: Sayfa, kullanıcıyı karşılayan bir hoş geldiniz mesajı ile başlar: `"Welcome Back!"` ve ardından `"Login to continue"` şeklinde açıklama metni bulunur.
  - **E-posta Girişi**: Kullanıcıdan e-posta adresini girmesi istenir. E-posta adresi, **TextField** widget'ı ile alınır.
  - **Şifre Girişi**: Kullanıcıdan şifre girmesi istenir. Şifre **obscureText** olarak gizlenir, böylece kullanıcı şifresini göremez. Kullanıcı şifreyi göstermek için ikonla değiştirebilir.
  - **Şifreyi Unuttum Linki**: Kullanıcı şifresini unuttuğunda, **"Forgot Password?"** linkine tıklayarak şifre sıfırlama sayfasına yönlendirilir.
  - **Login Butonu**: Kullanıcı doğru e-posta ve şifreyi girdiyse, **Login** butonuna tıklayarak giriş yapar ve **LandingPage** sayfasına yönlendirilir.
  - **Kayıt Olma Linki**: Kullanıcı henüz bir hesabı yoksa, **"Register Now"** butonuna tıklayarak kayıt olma sayfasına yönlendirilir.

- **Tasarım**:
  - Sayfa, **LinearGradient** ile mavi tonlarda bir arka plan gradienti ile tasarlanmıştır.
  - Sayfa içeriği **Card** widget'ı ile şekillendirilmiş ve kenarlarda yuvarlatılmış köşeler kullanılmıştır.
  - **Hero Widget** ile animasyonlu bir logo veya simge eklenebilir.
  - **ElevatedButton** ile giriş butonu yerleştirilmiş, yuvarlatılmış köşeler ve mavi renk ile dikkat çekici hale getirilmiştir.
  - Kullanıcı etkileşimini kolaylaştırmak için **TextButton** ve **Divider** gibi öğeler de kullanılmıştır.

- **Kullanıcı Deneyimi (UX)**:
  - **Get.to()** ile kullanıcıyı dinamik şekilde başka sayfalara yönlendirebilirsiniz. 
  - Giriş hatası durumunda, kullanıcıya Firebase'den alınan hata mesajları, **Get.snackbar()** ile bildirilir.

- **Kullanılan Widget'lar**:
  - `Scaffold`: Temel yapı için kullanılır.
  - `TextField`: Kullanıcıdan e-posta ve şifre almak için kullanılır.
  - `ElevatedButton`: Giriş butonunun stilini ve fonksiyonunu sağlar.
  - `TextButton`: Şifre sıfırlama ve kayıt olma yönlendirmeleri için kullanılır.
  - `Get.snackbar()`: Hata mesajlarını kullanıcıya bildirmek için kullanılır.
  - `Hero`: Animasyonlu logo ya da simge için kullanılır.
  - `Card`: Sayfa içeriğini stilize etmek için kullanılır.
  - `Divider`: Bölüm ayırıcı çizgi için kullanılır.

Bu sayfa, kullanıcıların giriş yapmasını sağlayan ana sayfadır ve kullanıcı etkileşimini yönetmek için gerekli tüm öğeleri içerir.


![Image](https://github.com/user-attachments/assets/dcfa0936-00e1-4600-87a3-480e2573228a)


### 3. **Signup Sayfası**

- **Görev**: Kullanıcıların e-posta ve şifre ile yeni bir hesap oluşturmasını sağlar.
  - Kullanıcı başarılı bir şekilde kayıt olduktan sonra, **Wrapper** sayfasına yönlendirilir.
  - Eğer kullanıcı, geçerli bir e-posta girmezse veya şifre en az 6 karakter uzunluğunda değilse, kullanıcıya hata mesajı gösterilir.
  - Kullanıcı zaten bir hesaba sahipse, **"Login"** butonuna tıklayarak giriş ekranına geri dönebilir.
  - **Firebase Authentication** kullanılarak kullanıcı kaydı yapılır ve hata durumunda kullanıcı bilgilendirilir.

- **İçerikler**:
  - **Başlık**: Sayfa, kullanıcıya `"Join Us Today!"` şeklinde bir karşılama mesajı gösterir. Altında `"Create an account to access the latest news and updates."` şeklinde açıklama yer alır.
  - **E-posta Girişi**: Kullanıcıdan geçerli bir e-posta adresi girmesi istenir. **TextField** widget'ı ile alınır.
  - **Şifre Girişi**: Kullanıcıdan şifre girmesi istenir. Şifre **obscureText** olarak gizlenir, böylece kullanıcı şifresini göremez. Kullanıcı şifreyi göstermek için ikonla değiştirebilir.
  - **Kayıt Butonu**: Kullanıcı gerekli bilgileri girerse, **"Sign Up"** butonuna tıklayarak hesap oluşturur ve **Wrapper** sayfasına yönlendirilir.
  - **Giriş Yapma Linki**: Kullanıcı zaten bir hesaba sahipse, **"Login"** butonuna tıklayarak giriş sayfasına geri dönebilir.

- **Tasarım**:
  - Sayfa, **LinearGradient** ile yeşil tonlarda bir arka plan gradienti ile tasarlanmıştır.
  - Sayfa içeriği **Card** widget'ı ile şekillendirilmiş ve kenarlarda yuvarlatılmış köşeler kullanılmıştır.
  - **Icon** ve **Text** widget'ları ile sayfada dikkat çekici başlıklar ve açıklamalar yer alır.
  - **ElevatedButton** ile kayıt butonu yerleştirilmiş, yuvarlatılmış köşeler ve yeşil renk ile dikkat çekici hale getirilmiştir.
  - Kullanıcı etkileşimini kolaylaştırmak için **TextButton** ve **Divider** gibi öğeler de kullanılmıştır.

- **Kullanıcı Deneyimi (UX)**:
  - **Get.back()** ile kullanıcıyı önceki sayfaya yönlendirerek geri dönüş sağlanır.
  - Kayıt işlemi sırasında kullanıcıdan eksik bilgi veya hatalı şifre girişi yapılırsa, kullanıcıyı bilgilendirmek için **SnackBar** kullanılır.

- **Kullanılan Widget'lar**:
  - `Scaffold`: Temel yapı için kullanılır.
  - `TextField`: Kullanıcıdan e-posta ve şifre almak için kullanılır.
  - `ElevatedButton`: Kayıt butonunun stilini ve fonksiyonunu sağlar.
  - `TextButton`: Giriş yapma linki için kullanılır.
  - `SnackBar`: Kullanıcıya hata mesajlarını göstermek için kullanılır.
  - `Icon`: Sayfada logo veya simge olarak kullanılır.
  - `Card`: Sayfa içeriğini stilize etmek için kullanılır.
  - `Divider`: Bölüm ayırıcı çizgi için kullanılır.

Bu sayfa, kullanıcıların yeni bir hesap oluşturmasına olanak tanır ve giriş yapma, hatalı giriş gibi durumlarda kullanıcıya yönlendirmeler sağlar.


![Image](https://github.com/user-attachments/assets/ccf52165-8a87-45e3-adf5-87981a6a1ea0)


### 4. **Forgot Password Sayfası**

- **Görev**: Kullanıcının şifresini unuttuğu durumda, e-posta adresi girerek şifre sıfırlama bağlantısı almasını sağlar.
  - Kullanıcı, e-posta adresini girip **"Send Reset Link"** butonuna tıkladığında, **Firebase Authentication** servisi aracılığıyla şifre sıfırlama bağlantısı gönderilir.
  - İşlem tamamlandığında, kullanıcıya bir onay mesajı (SnackBar) gösterilir.
  - Şifre sıfırlama işlemi için kullanıcının geçerli bir e-posta adresi girmesi gerekir.
  - Kullanıcı, şifre sıfırlama işlemi tamamlandıktan sonra **Login** sayfasına geri dönebilir.

- **İçerikler**:
  - **Başlık**: Sayfa, kullanıcıya `"Forgot Password?"` başlığı ile karşılar. Altında `"Enter your email to receive a reset link."` şeklinde açıklama yer alır.
  - **E-posta Girişi**: Kullanıcıdan şifre sıfırlama için geçerli bir e-posta adresi girmesi istenir. **TextField** widget'ı ile alınır.
  - **Şifre Sıfırlama Butonu**: Kullanıcı, geçerli e-posta adresini girip **"Send Reset Link"** butonuna tıkladığında şifre sıfırlama bağlantısı gönderilir.
  - **Geri Dönüş Linki**: Kullanıcı, şifre sıfırlama işlemi sonrası giriş ekranına geri dönmek için **"Back to Login"** butonuna tıklayarak giriş ekranına yönlendirilir.

- **Tasarım**:
  - Sayfa, **LinearGradient** ile mor tonlarda bir arka plan gradienti ile tasarlanmıştır.
  - Sayfa içeriği **Card** widget'ı ile şekillendirilmiş ve kenarlarda yuvarlatılmış köşeler kullanılmıştır.
  - **Icon** ve **Text** widget'ları ile sayfada dikkat çekici başlıklar ve açıklamalar yer alır.
  - **ElevatedButton** ile şifre sıfırlama butonu yerleştirilmiş, yuvarlatılmış köşeler ve mor renk ile dikkat çekici hale getirilmiştir.
  - Kullanıcı etkileşimini kolaylaştırmak için **TextButton** ve **Divider** gibi öğeler de kullanılmıştır.

- **Kullanıcı Deneyimi (UX)**:
  - **SnackBar** kullanılarak kullanıcıya, şifre sıfırlama bağlantısının gönderildiğine dair bilgi verilir.
  - Kullanıcı, şifre sıfırlama işleminden sonra geri dönmek için **Navigator.pop(context)** ile giriş sayfasına yönlendirilir.

- **Kullanılan Widget'lar**:
  - `Scaffold`: Temel yapı için kullanılır.
  - `TextField`: Kullanıcıdan e-posta almak için kullanılır.
  - `ElevatedButton`: Şifre sıfırlama butonunun stilini ve fonksiyonunu sağlar.
  - `TextButton`: Giriş sayfasına geri dönmek için kullanılır.
  - `SnackBar`: Kullanıcıya şifre sıfırlama işleminin başarıyla tamamlandığını bildirmek için kullanılır.
  - `Icon`: Sayfada logo veya simge olarak kullanılır.
  - `Card`: Sayfa içeriğini stilize etmek için kullanılır.
  - `Divider`: Bölüm ayırıcı çizgi için kullanılır.

Bu sayfa, kullanıcıların şifrelerini sıfırlamalarına olanak tanır ve işlem sonrasında onları bilgilendirir.

  
![Image](https://github.com/user-attachments/assets/c99f9b49-8834-4433-b2b2-ed5b8ab43206)

## 5. Home Sayfası (Ana Sayfa)

### 🎯 Görev
- Kullanıcıya kategori bazlı ve en güncel haberleri göstermek.
- Kaydırmalı haber slider'ı (carousel), kategori filtreleme ve trend haber listesi gibi özelliklerle zengin bir kullanıcı deneyimi sunmak.
- Drawer menüsü ile navigasyon sağlamak (Tüm Haberler, Çıkış).

---

### 🧱 İçerikler ve Bileşenler

#### 📌 AppBar
- Başlık: `"BTNews"` (BT siyah, News mavi renkte)
- Ortalanmış, gölgesiz ve beyaz arka planlı

---

#### 📂 Drawer (Yan Menü)
- **DrawerHeader**: Uygulama logosu (network üzerinden alınan görsel)
- **Log Out**: Kullanıcıyı `Login` sayfasına yönlendirir
- **All News**: Tüm haberleri gösteren `AllNews` sayfasına yönlendirir

---

#### 📚 Kategoriler (CategoryTile)
- Yatay scroll yapılabilir liste
- Her bir kategori kartında görsel ve kategori adı yer alır
- Tıklanıldığında `CategoryNews` sayfasına yönlendirir

---

#### 🚨 Breaking News!
- Başlık: `"Breaking News!"`
- Yanında `"View All"` linki (Tüm haberleri `AllNews` sayfasında açar)
- Altında: `CarouselSlider` bileşeni (slider):
  - İlk 10 haber görsel ve başlıkla birlikte gösterilir
  - Tıklanıldığında `ArticleView` (detay) sayfasına yönlendirir
- Altında: `AnimatedSmoothIndicator` → aktif slider noktasını belirtir

---

#### 🔥 Trending News!
- Başlık: `"Trending News!"`
- Scrollable `ListView.builder` ile tüm haberler listelenir
- Her haber bir `BlogTile` bileşenidir:
  - Görsel + Başlık + Açıklama içerir
  - Tıklanıldığında `ArticleView` sayfasına yönlendirir

---

### 🔄 Yükleme Durumu
- `CircularProgressIndicator` gösterilir, haberler yüklenene kadar

---

### 📦 Kullanılan Paketler
- `cached_network_image`: Haber görsellerini önbellekli yükler
- `carousel_slider`: Kaydırmalı haber slider'ı
- `smooth_page_indicator`: Slider nokta göstergesi
- `webview_flutter`: Haber detaylarında web içeriklerini gösterir

---

### 👨‍💻 Kullanıcı Deneyimi
- Kategorilerle filtreleme yapabilir
- Slider ile hızlıca öne çıkan haberleri gezebilir
- Trend haberleri aşağıda liste halinde görebilir
- Drawer menüsüyle kolay navigasyon

  
![Image](https://github.com/user-attachments/assets/4b177410-325d-428f-8965-374754913852)


### 6. **All News Sayfası**

- **Görev**: Kullanıcılara tüm haberlerin listesini sunar ve her bir haberi tıklanabilir şekilde gösterir. Her tıklama, kullanıcıyı haberin detay sayfasına yönlendirir.
  - **Listeleme**: `articles` adlı liste üzerinden tüm haberler dinamik olarak listelenir.
  - **Tıklama Etkileşimi**: Kullanıcı bir haber başlığına tıkladığında, ilgili haberin detay sayfasına yönlendirilir.
  - **Resim ve Açıklamalar**: Her bir haberin başlık, açıklama ve görseli, kullanıcılara detaylı bir şekilde sunulur.

- **İçerikler**:
  - **Başlık**: Sayfanın üst kısmında `"All News"` başlığı gösterilir.
  - **Haber Kartları**: Her haber için bir **Card** widget'ı kullanılır. Kartlar, başlık, açıklama ve resim içerir.
    - **Resim**: Her haberin görseli, **CachedNetworkImage** widget'ı ile gösterilir. Resim, yüklendikçe bir animasyonla gösterilir.
    - **Başlık**: Haber başlıkları **Text** widget'ı ile görünür. Başlık, taşma durumunda üç nokta (...) ile kısıtlanır.
    - **Açıklama**: Haber açıklamaları da **Text** widget'ı ile gösterilir ve uzun metinlerde taşma durumunda üç nokta ile kısıtlanır.
  - **Tıklanabilirlik**: Her haberin kartına tıklandığında, kullanıcı haberin detay sayfasına yönlendirilir.
  - **Placeholder Resim**: Eğer haberin görseli yoksa veya yüklenemezse, yer tutucu bir resim gösterilir.

- **Tasarım**:
  - **AppBar**: Üst kısımda `"All News"` başlığı bulunan bir **AppBar** bulunur. AppBar, beyaz arka plan ve siyah renkli ikonlarla tasarlanmıştır.
  - **Card**: Haberlerin her biri **Card** widget'ı ile görsel olarak ayrılır. Kartların köşeleri yuvarlatılmıştır.
  - **Row ve Column**: Her bir haberin görseli ve metni bir **Row** içinde, metin kısmı ise **Column** ile düzenlenir. Görselin etrafında boşluk bırakılır ve metinler sola yaslanır.
  - **CachedNetworkImage**: Resimlerin önbelleğe alınarak hızlı bir şekilde gösterilmesi sağlanır. Eğer resim yüklenemezse, yer tutucu bir resim gösterilir.
  - **ElevatedButton**: Her bir haber başlığına tıklandığında, detay sayfasına yönlendirme yapılır.

- **Kullanıcı Deneyimi (UX)**:
  - **Hızlı Görsel Yükleme**: Resimler hızlı bir şekilde yüklenir ve ağ bağlantısı zayıf olsa bile **CachedNetworkImage** sayesinde önbelleğe alınmış görseller gösterilir.
  - **Kolay Erişim**: Kullanıcılar, haberlerin detaylarını kolayca görmek için başlıklara tıklayabilirler.
  - **Dinamik Listeleme**: Haberler liste şeklinde dinamik olarak sıralanır ve kullanıcının ihtiyacına göre ekranı verimli bir şekilde kullanır.

- **Kullanılan Widget'lar**:
  - `Scaffold`: Sayfa yapısı için kullanılır.
  - `AppBar`: Sayfa başlığını ve stilini sağlar.
  - `ListView.builder`: Haberleri dinamik olarak listelemek için kullanılır.
  - `GestureDetector`: Her bir haber kartına tıklanabilirlik ekler.
  - `Card`: Her bir haberin görsel ve metin içeriğini kapsar.
  - `ClipRRect`: Resmin köşelerinin yuvarlatılması için kullanılır.
  - `CachedNetworkImage`: İnternetten alınan görselleri önbelleğe alarak gösterir.
  - `Text`: Başlık ve açıklama metinlerinin görüntülenmesini sağlar.
  - `SizedBox`: Widget'lar arasına boşluk ekler.
  - `MaterialPageRoute`: Kullanıcıyı haberin detay sayfasına yönlendirmek için kullanılır.

Bu sayfa, tüm haberlerin listelendiği, her bir haberin detaylarına tıklanarak ulaşılabilen dinamik bir yapıdır.

![Image](https://github.com/user-attachments/assets/cdc7f3d0-aca3-460a-a8c7-67a615afe2ae)

### 7. **Category News Sayfası**

- **Görev**: Kullanıcının seçtiği haber kategorisine göre ilgili haberleri listeleyen sayfadır. Her bir haber, görsel, başlık ve açıklama ile birlikte gösterilir ve tıklanabilir yapıdadır.
  - Kullanıcının seçtiği kategoriye özel haberleri `ShowCategoryNews` servisi üzerinden çeker.
  - Her bir haberin başlığına tıklanıldığında `ArticleView` sayfasına yönlendirme yapılır.

---

#### ✅ **İşlevler**:

- `getNews()` fonksiyonu:
  - `ShowCategoryNews` sınıfı üzerinden ilgili kategoriye ait haberleri API'den çeker.
  - Gelen verileri `categories` listesine atar.
  - Sayfanın yüklendiğini göstermek için `_loading` değişkenini kullanır.

- `ListView.builder`:
  - `categories` listesine göre dinamik olarak haber kartları oluşturur.

- `ShowCategory` widget'ı:
  - Her haber için görsel, başlık ve açıklamayı gösteren özel bir widget’tır.
  - Habere tıklandığında kullanıcıyı detay sayfasına (`ArticleView`) yönlendirir.

---

#### 📦 **İçerikler**:

- **AppBar**:
  - Başlık: `"News"`
  - Renk: Arka plan beyaz, başlık metni mavi ve kalın yazı tipinde.
  - Ortalanmış başlık ve sıfır elevation.

- **Body**:
  - `ListView.builder`: Kategorideki tüm haberleri listeler.
  - `ShowCategory` kartları:
    - **Resim**: `CachedNetworkImage` ile hızlı ve önbellekli şekilde yüklenir.
    - **Başlık**: Kalın, siyah renkte ve maksimum 2 satırla sınırlı.
    - **Açıklama**: Açıklayıcı metin, maksimum 3 satırla gösterilir.
    - **Tıklanabilirlik**: Kartın tamamı tıklanabilir yapıdadır.

---

#### 🧱 **Kullanılan Yapılar & Widget'lar**:

- `StatefulWidget`: Dinamik veri çekme işlemleri için kullanılır.
- `initState()`: Sayfa açıldığında `getNews()` fonksiyonunun çalışmasını sağlar.
- `ListView.builder`: Haberleri dinamik şekilde listelemek için kullanılır.
- `GestureDetector`: Haberlere tıklanabilirlik ekler.
- `CachedNetworkImage`: Ağdan gelen görselleri önbelleğe alarak optimize yükleme sağlar.
- `ClipRRect`: Görsellerin köşelerini yuvarlatır.
- `MediaQuery`: Görselin genişliğini ekran boyutuna göre ayarlamak için kullanılır.
- `Navigator`: Sayfalar arası geçiş sağlar (`ArticleView` yönlendirmesi).

---

#### 🎯 **Kullanıcı Deneyimi (UX)**:

- **Kategoriye özel içerik**: Kullanıcılar ilgi alanlarına göre içerik görebilir.
- **Hızlı görsel yükleme**: Görsellerin önbellekten hızlı yüklenmesiyle akıcı bir deneyim sunulur.
- **Kolay gezinme**: Habere tıklandığında detaylı sayfaya yönlendirme yapılır.
- **Responsive tasarım**: Görseller ekran boyutuna göre ölçeklenir.

---

Bu sayfa, kullanıcıların belirli bir haber kategorisindeki içerikleri keşfetmelerine ve detay sayfasına kolayca ulaşmalarına imkân tanır.

![Image](https://github.com/user-attachments/assets/1f5833be-5576-4b5e-a417-d31233011609)

## 8. **ArticleView Sayfası**

### 🎯 Görev
- Kullanıcının tıkladığı haberi uygulama içerisinde **WebView** ile görüntüler.
- Haber kaynağının web sitesine yönlendirme yapmadan, uygulama içinden haber okunmasını sağlar.

---

### ✅ İşlevler
- `blogUrl`: Sayfaya parametre olarak gelen haberin URL’sidir.
- `WebViewController`: Web sayfasının yüklenmesini ve kontrolünü sağlar.
  - `setJavaScriptMode(JavaScriptMode.unrestricted)`: JavaScript kullanımını aktif eder.
  - `loadRequest(Uri.parse(blogUrl))`: Haberin URL’sini WebView içinde açar.

---

### 🧱 İçerikler

#### AppBar
- Ortalanmış başlık: `"Flutter News"` olarak yazılır.
  - `"Flutter"` → siyah renkte
  - `"News"` → mavi renkte ve kalın yazı stili
- Arka plan rengi: Beyaz
- Gölge: Yok (`elevation: 0.0`)

#### Body
- `WebViewWidget`: 
  - Haberi doğrudan uygulama içinde gösterir.
  - `WebViewController` üzerinden kontrol edilir.
  - JavaScript desteği açıktır.

---

### 📦 Kullanılan Paketler
- [`webview_flutter`](https://pub.dev/packages/webview_flutter): Web içeriklerini Flutter uygulaması içinde göstermek için kullanılır.

---

### 👨‍💻 Kullanıcı Deneyimi
- Uygulama dışına çıkmadan haber okuma imkânı sunar.
- Temiz ve sade AppBar tasarımı sayesinde dikkat dağıtmadan içerik okunabilir.
- WebView tüm ekranı kapladığı için odaklanmış bir deneyim sağlar.


![Image](https://github.com/user-attachments/assets/bb0ffceb-9f3e-421d-8133-25b7f607d01c)

---

# **Drawer Menü**
- Uygulamanın sol kenarından açılan menüdür.
- Tüm haberler ve Login sayfalarına geçiş yapılabilir.
- Üst kısmında dinamik olarak bir logo gösterilir.

![Image](https://github.com/user-attachments/assets/a7272720-c9a2-4b7c-8675-0529c5aa9bd6)
## 🖼️ Drawer Menüde Kullanılan Logo

Drawer menüsünde görüntülenen logo, dış bir API üzerinden dinamik olarak alınmaktadır.

- **Kullanılan API**: (https://pbs.twimg.com/profile_images/1347941491889549318/uvn8isXg_400x400.jpg)
- **Kullanım Örneği**:
  ```dart
  Image.network('https://source.unsplash.com/random/100x100/?news');


# Login Bilgilerinin Saklanması (Firebase Authentication)

![Image](https://github.com/user-attachments/assets/05a2ba52-d3bf-4470-96aa-d334161fb545)

### Kullanılan Paketler:
```yaml
 firebase_auth: ^4.6.2
 firebase_core: ^2.24.0
```
### Giriş İşlemi:
```dart
signIn() async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
```
### Çıkış Yapma:
```dart
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
```
# Haber API Bilgileri
Kullanılan API: NewsAPI.org

Veri Formatı: JSON

### Örnek API Kullanımı:
```dart
String url = "https://newsapi.org/v2/everything?q=tesla&from=$formattedDate&sortBy=publishedAt&apiKey=8ca749c4e11d4b70a9562dc36918717a";
// HTTP GET isteği gönderiyoruz
    var response = await http.get(Uri.parse(url));
    
    // JSON yanıtını çözümleyerek verileri alıyoruz
    var jsonData = jsonDecode(response.body);
```
### Dönen Veri Örneği:
```dart
ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
```
# Grup Üyeleri ve Katkıları:
- Tugay Yalçın: Firebase login/signup/forgot işlemleri/Drawer menü ve UI düzenlemeleri
- Berkay Kantaş: API'den veri çekme, kategori filtreleme/Article view sayfası, yönlendirme sistemi/Landing page ve UI düzenlemeleri



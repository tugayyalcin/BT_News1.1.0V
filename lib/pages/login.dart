import 'package:bt_news/pages/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:bt_news/pages/forgot.dart';
import 'package:bt_news/pages/signup.dart';


// Login Sayfası (Kullanıcı Girişi Ekranı)
// Bu ekran, kullanıcıların e-posta ve şifre ile giriş yapmasını sağlar.
// Kullanıcı, doğru bilgilerle giriş yaparsa ana sayfaya (LandingPage) yönlendirilir.
// Eğer giriş bilgileri hatalıysa, Firebase Authentication hatalarını gösterir ve kullanıcıyı bilgilendirir.
// Şifresini unutan kullanıcılar, "Forgot Password?" linkine tıklayarak şifre sıfırlama işlemi yapabilir.
// Ayrıca, henüz hesabı olmayan kullanıcılar "Register Now" butonuna tıklayarak kayıt olma ekranına yönlendirilebilir.



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email=TextEditingController();
  TextEditingController password= TextEditingController();
  bool obscurePassword = true;


  signIn() async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );

    // Başarılı girişten sonra yönlendir
    Get.offAll(() => LandingPage()); // önceki sayfaları da kapatır

  } on FirebaseAuthException catch (e) {
    String errorMessage = '';
    if (e.code == 'user-not-found') {
      errorMessage = 'No users registered with this email address were found.';
    } else if (e.code == 'wrong-password') {
      errorMessage = 'You entered an incorrect password.';
    } else {
      errorMessage = 'An error occurred during login: ${e.message}';
    }

    // Uyarı mesajını göster
    Get.snackbar(
      'You have entered an incorrect entry.',
      errorMessage,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.blue.shade300],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 12,
              shadowColor: Colors.blueAccent.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Animasyon ya da logo gibi bir şey eklemek istersek buraya:
                    Hero(
                      tag: "logo",
                      child: Icon(Icons.lock, size: 70, color: Colors.blueAccent),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Login to continue",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
  controller: password,
  obscureText: obscurePassword,
  decoration: InputDecoration(
    labelText: 'Password',
    prefixIcon: Icon(Icons.lock),
    suffixIcon: IconButton(
      icon: Icon(
        obscurePassword ? Icons.visibility_off : Icons.visibility,
        color: Colors.grey,
      ),
      onPressed: () {
        setState(() {
          obscurePassword = !obscurePassword;
        });
      },
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Get.to(Forgot()),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => signIn(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 10),
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () => Get.to(Signup()),
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}

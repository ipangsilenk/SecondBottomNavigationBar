import 'package:flutter/material.dart';
import 'dart:async'; // Untuk Future.delayed

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Menambahkan delay untuk splash screen
    Future.delayed(Duration(seconds: 3), () {
      // Setelah 3 detik, navigasi ke halaman utama
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Aplikasi Saya',  // Judul berada di atas gambar
              style: TextStyle(
                fontSize: 24, // Ukuran font untuk judul
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),  // Memberikan jarak antara judul dan gambar
            Image.asset(
              'assets/logo.png',  // Memuat logo
              width: 10,  // Mengatur lebar gambar (sesuaikan sesuai kebutuhan)
              height: 10,  // Mengatur tinggi gambar (sesuaikan sesuai kebutuhan)
              fit: BoxFit.contain,  // Menyesuaikan ukuran gambar dengan baik
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Text('Selamat datang di aplikasi!'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/Home_Screens.dart';
import 'screens/Control.dart';
import 'dart:async'; // Untuk Timer

void main() {
  runApp(
    MaterialApp(
      title: 'Bottom Navigation Bar',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Set splash screen sebagai halaman pertama
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay untuk splash screen selama 3 detik
    Future.delayed(Duration(seconds: 3), () {
      // Setelah 3 detik, navigasi ke HomePage
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
        child: Image.asset('assets/logo.png'),  // Ganti dengan path logo Anda
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeScreen(),
          Control(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
          horizontal: displayWidth * 0.1, // Jarak horizontal di sisi kiri dan kanan
          vertical: displayWidth * 0.03, // Jarak vertikal dari bawah layar
        ),
        height: displayWidth * 0.15, // Menyesuaikan tinggi bottom navigation
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            listOfIcons.length,
            (index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    listOfIcons[index],
                    size: displayWidth * 0.08, // Ukuran ikon lebih besar
                    color: currentIndex == index
                        ? const Color.fromARGB(255, 255, 68, 68)
                        : Colors.black26,
                  ),
                  SizedBox(height: 5),
                  Text(
                    listOfStrings[index],
                    style: TextStyle(
                      fontSize: displayWidth * 0.03,
                      fontWeight: FontWeight.w600,
                      color: currentIndex == index
                          ? const Color.fromARGB(255, 255, 68, 68)
                          : Colors.black26,
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

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.dashboard,
  ];

  List<String> listOfStrings = [
    'Home',
    'Control',
  ];
}

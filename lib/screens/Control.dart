import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  // Variabel untuk menyimpan status on/off
  bool isOn1 = false;
  bool isOn2 = false;
  bool isOn3 = false;
  bool isOn4 = false;

  // Fungsi untuk mengubah status on/off
  void _toggleButton(int buttonNumber) {
    setState(() {
      // Gunakan if else terpisah untuk masing-masing tombol
      switch (buttonNumber) {
        case 1:
          isOn1 = !isOn1;
          break;
        case 2:
          isOn2 = !isOn2;
          break;
        case 3:
          isOn3 = !isOn3;
          break;
        case 4:
          isOn4 = !isOn4;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Control Button',
          style: TextStyle(
            color: Colors.white, // Menetapkan warna teks menjadi putih
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 29, 29),
        flexibleSpace: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              // Gambar logo di sebelah kiri
              Image.asset(
                'assets/logo.png', // Ganti dengan path gambar Anda
                height: 60, // Besarkan ukuran gambar
              ),
              const SizedBox(width: 80), // Menambahkan jarak antara gambar dan judul
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), // Sudut kiri bawah
            bottomRight: Radius.circular(30), // Sudut kanan bawah
          ),
        ),
      ),
      body: SingleChildScrollView( // Tambahkan SingleChildScrollView di sini
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Menampilkan gambar main-logo.webp di atas tombol
              Center(
                child: Image.asset(
                  'assets/main-logo.webp', // Menampilkan gambar main-logo.webp
                  height: 70, // Sesuaikan ukuran gambar
                ),
              ),
              const SizedBox(height: 30),
              // Baris pertama tombol (dua di atas)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Button 1'),
                      ElevatedButton.icon(
                        onPressed: () => _toggleButton(1), // Fungsi toggle untuk Button 1
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isOn1 ? Colors.green : Colors.red, // Hijau jika on, merah jika off
                          foregroundColor: Colors.white, // Menetapkan warna teks tombol
                          minimumSize: Size(70, 70), // Menetapkan ukuran tombol menjadi lebih besar
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Menambah sudut tombol
                          ),
                        ),
                        icon: Icon(
                          Icons.power_settings_new, // Ikon power
                          size: 60, // Ukuran ikon diubah menjadi 60
                        ),
                        label: Text(''), // Tidak ada teks di dalam tombol
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Button 2'),
                      ElevatedButton.icon(
                        onPressed: () => _toggleButton(2), // Fungsi toggle untuk Button 2
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isOn2 ? Colors.green : Colors.red, // Hijau jika on, merah jika off
                          foregroundColor: Colors.white, // Menetapkan warna teks tombol
                          minimumSize: Size(70, 70), // Menetapkan ukuran tombol menjadi lebih besar
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Menambah sudut tombol
                          ),
                        ),
                        icon: Icon(
                          Icons.power_settings_new, // Ikon power
                          size: 60, // Ukuran ikon diubah menjadi 60
                        ),
                        label: Text(''), // Tidak ada teks di dalam tombol
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30), // Spacer untuk memberikan jarak antar tombol
              // Baris kedua tombol (dua di bawah)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Button 3'),
                      ElevatedButton.icon(
                        onPressed: () => _toggleButton(3), // Fungsi toggle untuk Button 3
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isOn3 ? Colors.green : Colors.red, // Hijau jika on, merah jika off
                          foregroundColor: Colors.white, // Menetapkan warna teks tombol
                          minimumSize: Size(70, 70), // Menetapkan ukuran tombol menjadi lebih besar
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Menambah sudut tombol
                          ),
                        ),
                        icon: Icon(
                          Icons.power_settings_new, // Ikon power
                          size: 60, // Ukuran ikon diubah menjadi 60
                        ),
                        label: Text(''), // Tidak ada teks di dalam tombol
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Button 4'),
                      ElevatedButton.icon(
                        onPressed: () => _toggleButton(4), // Fungsi toggle untuk Button 4
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isOn4 ? Colors.green : Colors.red, // Hijau jika on, merah jika off
                          foregroundColor: Colors.white, // Menetapkan warna teks tombol
                          minimumSize: Size(70, 70), // Menetapkan ukuran tombol menjadi lebih besar
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Menambah sudut tombol
                          ),
                        ),
                        icon: Icon(
                          Icons.power_settings_new, // Ikon power
                          size: 60, // Ukuran ikon diubah menjadi 60
                        ),
                        label: Text(''), // Tidak ada teks di dalam tombol
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

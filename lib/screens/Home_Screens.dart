import 'package:flutter/material.dart';
import 'package:bottom_navigation_bar/detail/Detail.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Optimalisasi Suhu Ruang',
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
              Image.asset(
                'assets/logo.png', // Ganti dengan path gambar Anda
                height: 60, // Sesuaikan ukuran gambar
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Menambahkan gambar di atas judul
              Image.asset(
                'assets/main-logo.webp', // Ganti dengan path gambar Anda
                height: 80, // Sesuaikan ukuran gambar
              ),
              const SizedBox(height: 10),

              // GridView untuk gauges
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  GestureDetector(
                    onTap: () {
                      _showDetailDialog(context, 'Suhu Ruang', [26, 27, 28, 30]);
                    },
                    child: _buildCard('Suhu Ruang', 26, '26°C'),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showDetailDialog(
                          context, 'Kelembapan Udara', [60, 65, 70, 75]);
                    },
                    child: _buildCard('Kelembapan Udara', 65, '65%'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showDetailDialog(context, 'Kelembapan Tanah', [40, 45, 50]);
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: _buildCard('Kelembapan Tanah', 45, '45%'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDetailDialog(BuildContext context, String title, List<double> data) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Detail(title: title, data: data),
        );
      },
    );
  }

  Widget _buildCard(String title, double value, String annotation) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    ranges: <GaugeRange>[
                      GaugeRange(startValue: 0, endValue: 50, color: Colors.green),
                      GaugeRange(startValue: 50, endValue: 75, color: Colors.orange),
                      GaugeRange(startValue: 75, endValue: 100, color: Colors.red),
                    ],
                    pointers: <GaugePointer>[NeedlePointer(value: value)],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(
                          annotation,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

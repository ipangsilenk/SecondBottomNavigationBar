import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Detail extends StatelessWidget {
  final String title;
  final List<double> data;

  Detail({required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 243, 33, 33),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                borderData: FlBorderData(show: true),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        return Text('${value.toInt()}');
                      },
                    ),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: data.asMap().entries.map((entry) {
                      return FlSpot(entry.key.toDouble(), entry.value);
                    }).toList(),
                    isCurved: true,
                    dotData: FlDotData(show: false), // Optional: hide dots on the graph
                    belowBarData: BarAreaData(show: false),
                    color: const Color.fromARGB(255, 243, 33, 33),  // Here we specify the color directly
                    barWidth: 4,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
             style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 243, 33, 33), // Menetapkan warna latar belakang tombol
                    foregroundColor: Colors.white, // Menetapkan warna teks tombol
                    minimumSize: Size(50, 30), // Menetapkan ukuran tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Menambah sudut tombol
                    ),
                  ),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

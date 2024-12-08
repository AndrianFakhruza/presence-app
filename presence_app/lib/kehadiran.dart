import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AttendanceScreen(),
    );
  }
}

class AttendanceScreen extends StatelessWidget {
  final List<Color> attendanceColors = [
    Colors.green, // Hadir
    Colors.red, // Alpa
    Colors.yellow, // Izin
    Colors.blue, // Sakit
    Colors.blueGrey, // Libur
    Colors.pink,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pertemuan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kehadiran Anda :',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 16,
                itemBuilder: (context, index) {
                  Color cellColor;
                  if (index == 4 || index == 13) {
                    cellColor = Colors.red; // Alpa
                  } else if (index >= 14) {
                    cellColor = Colors.grey[100]!; // Belum Absen
                  } else {
                    cellColor = Colors.green; // Hadir
                  }

                  return Container(
                    decoration: BoxDecoration(
                      color: cellColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Kode Warna :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                _buildLegendItem('Hadir', Colors.green),
                _buildLegendItem('Alpa', Colors.red),
                _buildLegendItem('Izin', Colors.yellow),
                _buildLegendItem('Sakit', Colors.blue),
                _buildLegendItem('Libur', Colors.blueGrey),
                _buildLegendItem('Terlambat', Colors.pink),
                _buildLegendItem('Belum Absen', Colors.grey)
              ],
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(double.infinity, 48),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.qr_code_scanner),
                  label: Text('Scan QR Code'),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    minimumSize: Size(double.infinity, 48),
                  ),
                  onPressed: () {},
                  child: Text('Download RPS'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: 8),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}

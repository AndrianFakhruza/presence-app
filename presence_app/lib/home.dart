import 'package:flutter/material.dart';
import 'main.dart';
import 'profile.dart'; // Pastikan untuk mengimpor ProfilePage
import 'survei.dart';
import 'kehadiran.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Kelas',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.school,
                    size: 40,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Politeknik Negeri Lhokseumawe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('Daftar Survei'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SurveyListScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Febri Fanisa, S.Tr.Kom.',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Daftar kelas anda semester ini :',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildKelasItem(
                        context,
                        'Praktikum Pengolahan Citra Digital',
                        'D-IV Teknik Informatika',
                        'Senin / 07:30 - 11:10',
                        '3D'),
                    const SizedBox(height: 10),
                    _buildKelasItem(
                        context,
                        'Rancangan Analisa Algoritma',
                        'D-IV Teknik Informatika',
                        'Senin / 11:10 - 12:50',
                        '3D'),
                    const SizedBox(height: 10),
                    _buildKelasItem(
                        context,
                        'Praktikum Pemograman Mobile',
                        'D-IV Teknik Informatika',
                        'Selasa / 07:30 - 12:00',
                        '3D'),
                    const SizedBox(height: 10),
                    _buildKelasItem(
                        context,
                        'Keamanan Jaringan Komputer',
                        'D-IV Teknik Informatika',
                        'Selasa / 15:10 - 17:10',
                        '3D'),
                    const SizedBox(height: 10),
                    _buildKelasItem(
                        context,
                        'Pemrograman Mobile',
                        'D-IV Teknik Informatika',
                        'Rabu / 09:10 - 11:10',
                        '3D'),
                    const SizedBox(height: 10),
                    _buildKelasItem(
                        context,
                        'Bahasa Indonesia',
                        'D-IV Teknik Informatika',
                        'Rabu / 11:10 - 12:50',
                        '3D'),
                    const SizedBox(height: 10),
                    _buildKelasItem(
                        context,
                        'Pengolahan Citra Digital',
                        'D-IV Teknik Informatika',
                        'Rabu / 13:50 - 15:10',
                        '3D'),
                    const SizedBox(height: 10),
                    _buildKelasItem(
                        context,
                        'Statistik dan Probilitas',
                        'D-IV Teknik Informatika',
                        'Kamis / 09:10 - 11:10',
                        '3D'),
                    const SizedBox(height: 10),
                    _buildKelasItem(
                        context,
                        'Sistem Pengambilan Keputusan Dan SIM-SIG',
                        'D-IV Teknik Informatika',
                        'Kamis / 11:10 - 12:50',
                        '3D'),
                    const SizedBox(height: 10),
                    _buildKelasItem(
                        context,
                        'Praktikum Keamanan Jaringan Komputer',
                        'D-IV Teknik Informatika',
                        'Kamis / 13:30 - 18:00',
                        '3D'),
                    const SizedBox(height: 10),
                    _buildKelasItem(
                        context,
                        'Workshop Pengembangan Perangkat Lunak',
                        'D-IV Teknik Informatika',
                        'Jumat / 07:30 - 11:10',
                        '3D'),
                    const SizedBox(height: 10),
                    // Tambahkan kelas lain di sini
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKelasItem(BuildContext context, String title, String subTitle,
      String schedule, String classCode) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AttendanceScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subTitle,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(schedule),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.yellow.shade600,
                  ),
                  child: Text(
                    classCode,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

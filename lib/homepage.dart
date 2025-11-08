import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardPage(),  // Entry point diubah ke DashboardPage
    );
  }
}

// Halaman Dashboard
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasine Imam"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Aksi untuk notifikasi, bisa kosong atau tambahkan logika
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Bagian header
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              "Halo, Gusy",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // Gambar/banner (dummy menggunakan Container dengan warna)
          Container(
            height: 200,
            color: Colors.blueAccent,
            child: const Center(
              child: Text(
                "Banner Aplikasi",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Menu dalam bentuk Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(16.0),
              children: [
                // Menu Profil
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.person, size: 48, color: Colors.blue),
                      SizedBox(height: 8),
                      Text("Profil", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                // Menu Data
                InkWell(
                  onTap: () {
                    // Aksi untuk Data, bisa kosong atau tambahkan logika
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.list, size: 48, color: Colors.green),
                      SizedBox(height: 8),
                      Text("Data", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                // Menu Pengaturan
                InkWell(
                  onTap: () {
                    // Aksi untuk Pengaturan, bisa kosong atau tambahkan logika
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.settings, size: 48, color: Colors.orange),
                      SizedBox(height: 8),
                      Text("Pengaturan", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Profil
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Profil"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto/avatar (dummy menggunakan CircleAvatar dengan ikon)
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            // Text nama
            const Text(
              "Nama: Imam Suyuti",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Text NIM/ID
            const Text(
              "NIM: 23670074",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            // Text email
            const Text(
              "Email: simam2170@gmail.com",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Row untuk info lain (Prodi - Semester)
            const Row(
              children: [
                Text("Prodi: Informatika", style: TextStyle(fontSize: 16)),
                SizedBox(width: 20),
                Text("Semester: 12", style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 40),
            // Tombol Kembali ke Dashboard
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke Dashboard
              },
              child: const Text("Kembali ke Dashboard"),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:imamsu1/screens/profile_page.dart';
import '../screens/product_list_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasine imam"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // aksi notifikasi
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              "Halo, imaaaammm",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 200,
            color: Colors.blueAccent,
            child: const Center(
              child: Text(
                "Banner Aplikasi",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(16.0),
              children: [
                // Profil
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
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
                // Data
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductListPage(),
                      ),
                    );
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
                // Pengaturan
                InkWell(
                  onTap: () {
                    // nanti diisi halaman pengaturan
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

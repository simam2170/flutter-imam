import 'package:flutter/material.dart';

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
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Nama: Imam Suyuti",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "NIM: 23670074",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "Email: simam2170@gmail.com",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Text("Prodi: Informatika", style: TextStyle(fontSize: 16)),
                SizedBox(width: 20),
                Text("Semester: 12", style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kembali ke Dashboard"),
            ),
          ],
        ),
      ),
    );
  }
}

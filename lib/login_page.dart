import 'package:flutter/material.dart';

// Halaman Login (dari kode yang Anda berikan, dengan sedikit penyesuaian navigasi)
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Simulasi login berhasil (ganti dengan logika autentikasi nyata)
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Berhasil'),
          content: const Text('Selamat datang di E-Commerce App!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                Navigator.pushReplacement( // Navigasi ke DashboardPage (bukan HomePage)
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.green.shade400], // Gradien biru ke hijau
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo atau Gambar
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.shopping_cart, // Placeholder ikon
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Judul
                  const Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Masuk ke akun Anda',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Field Email
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        prefixIcon: Icon(Icons.email, color: Colors.blue),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Masukkan email yang valid';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Field Password
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        prefixIcon: Icon(Icons.lock, color: Colors.blue),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        if (value.length < 6) {
                          return 'Password minimal 6 karakter';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Tombol Login
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      backgroundColor: Colors.blue.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Opsi Tambahan
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Fitur Lupa Password belum tersedia')),
                          );
                        },
                        child: const Text(
                          'Lupa Password?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Fitur Daftar Akun belum tersedia')),
                          );
                        },
                        child: const Text(
                          'Daftar Akun',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  // Login Sosial (Placeholder)
                  const SizedBox(height: 20),
                  const Text(
                    'Atau masuk dengan',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Placeholder untuk login Google
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login dengan Google belum tersedia')),
                          );
                        },
                        icon: const Icon(Icons.g_mobiledata, color: Colors.white),
                        label: const Text('Google'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Placeholder untuk login Facebook
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login dengan Facebook belum tersedia')),
                          );
                        },
                        icon: const Icon(Icons.facebook, color: Colors.white),
                        label: const Text('Facebook'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
        title: const Text("Aplikasine imam"),
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
              "Halo, imaaaammm",
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
              "NIM: 123200045",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            // Text email
            const Text(
              "Email: imam@gmail.com",
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

// main.dart (entry point)
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
      home: const LoginPage(),  // Entry point diubah ke LoginPage
    );
  }
}
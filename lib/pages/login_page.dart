import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk menangkap teks yang diinputkan pengguna
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // Variabel untuk mengatur apakah password disembunyikan atau ditampilkan
  bool _isObscure = true;

  // Fungsi untuk menangani logika login
  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Pengecekan sederhana: Jika input tidak kosong, baru bisa masuk
    if (username.isNotEmpty && password.isNotEmpty) {
      // Rubrik 1: Pindah menggunakan pushReplacementNamed
      Navigator.pushReplacementNamed(context, '/main');
    } else {
      // Tampilkan pesan error jika form kosong
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username dan Password harus diisi!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    // Selalu dispose controller untuk mencegah kebocoran memori (memory leak)
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // SingleChildScrollView agar form bisa di-scroll saat keyboard muncul
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.movie_creation, size: 100, color: Colors.blueAccent),
              const SizedBox(height: 20),
              const Text(
                'Selamat Datang di CinePlay',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              // Input Field Username
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Input Field Password
              TextField(
                controller: _passwordController,
                obscureText: _isObscure, // Mengatur password disensor atau tidak
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Tombol mata untuk melihat password
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),
              
              // Tombol Masuk
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _login, // Memanggil fungsi _login yang dibuat di atas
                child: const Text(
                  'Masuk', 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 1. WIDGET UTAMA
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
    );
  }
}

// 2. HALAMAN UTAMA (Scaffold)
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum 1: Widgets'),
        backgroundColor: Colors.blue,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GreetingWidget(), // Memanggil StatelessWidget
            SizedBox(height: 20), // Jarak vertikal
            BalanceCardWidget(), // Memanggil StatefulWidget
          ],
        ),
      ),
    );
  }
}

// 3. STATELESS WIDGET (Sapaan Pengguna)
class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        // Ikon Profil
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.teal,
          child: Icon(Icons.person, size: 30, color: Colors.white),
        ),
        SizedBox(width: 12),
        // Teks Sapaan
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, Budi!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Selamat datang kembali!',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// 4. STATEFUL WIDGET (Kartu Saldo dengan Toggle)
class BalanceCardWidget extends StatefulWidget {
  const BalanceCardWidget({super.key});

  @override
  State<BalanceCardWidget> createState() => _BalanceCardWidgetState();
}

class _BalanceCardWidgetState extends State<BalanceCardWidget> {
  // Variabel State: Menyimpan status apakah saldo terlihat
  bool _isBalanceVisible = true;

  // Fungsi untuk mengubah state (toggle visibility)
  void _toggleVisibility() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.teal, // Menggunakan warna teal
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Baris atas kartu: Teks "Saldo Utama" & Tombol Ikon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Saldo Utama',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _isBalanceVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: _toggleVisibility,
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Teks Nominal Saldo
            Text(
              _isBalanceVisible ? 'Rp 5.000.000' : 'Rp *********',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8), // Jarak vertikal
            // Penambahan No. Rekening di bawah nominal saldo
            const Text(
              'No. Rekening: 1234-5678',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 1. WIDGET UTAMA (Root Aplikasi)
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



// 3. STATELESS WIDGET (Sapaan)
class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const collum(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.person, size: 30, color: Colors.white),
        ),
        SizedBox(width: 12),
        row(
         
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, Budi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Selamat datang kembali!',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

// 4. STATEFUL WIDGET (Kartu Saldo)
class BalanceCardWidget extends StatefulWidget {
  const BalanceCardWidget({super.key});

  @override
  State<BalanceCardWidget> createState() => _BalanceCardWidgetState();
}

class _BalanceCardWidgetState extends State<BalanceCardWidget> {
  bool _isBalanceVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Saldo Utama',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
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
            Text(
              _isBalanceVisible ? 'Rp 5.000.000' : 'Rp **********',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 5. WIDGET TOMBOL AKSI (ROW)
class ActionButtonsWidget extends StatelessWidget {
  const ActionButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(Icons.arrow_downward, 'Pemasukan', Colors.green),
        _buildActionButton(Icons.arrow_upward, 'Pengeluaran', Colors.red),
        _buildActionButton(Icons.swap_horiz, 'Transfer', Colors.blue),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

// 6. WIDGET DAFTAR TRANSAKSI (COLUMN & LISTTILE)
class RecentTransactionsWidget extends StatelessWidget {
  const RecentTransactionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Transaksi Terakhir',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            children: [
              // Item Transaksi 1 (Pengeluaran)
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Icon(Icons.fastfood, color: Colors.white),
                ),
                title: Text('Makan Siang'),
                subtitle: Text('13 Sep 2026'),
                trailing: Text(
                  '- Rp 50.000',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(height: 1),

              // Item Transaksi 2 (Pemasukan)
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.attach_money, color: Colors.white),
                ),
                title: Text('Gaji Bulanan'),
                subtitle: Text('01 Sep 2026'),
                trailing: Text(
                  '+ Rp 5.000.000',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(height: 1),

              // Item Transaksi 3 (Pengeluaran)
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.directions_car, color: Colors.white),
                ),
                title: Text('Isi Bensin'),
                subtitle: Text('10 Sep 2026'),
                trailing: Text(
                  '- Rp 150.000',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(height: 1),

              // Item Transaksi 4 (Tugas 2: Tambah Data Fiktif 1)
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.shopping_bag, color: Colors.white),
                ),
                title: Text('Belanja Bulanan'),
                subtitle: Text('08 Sep 2026'),
                trailing: Text(
                  '- Rp 350.000',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(height: 1),

              // Item Transaksi 5 (Tugas 2: Tambah Data Fiktif 2)
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.laptop, color: Colors.white),
                ),
                title: Text('Bonus Proyek'),
                subtitle: Text('05 Sep 2026'),
                trailing: Text(
                  '+ Rp 1.500.000',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
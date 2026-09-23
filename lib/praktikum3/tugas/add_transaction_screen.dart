import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => AddTransactionScreenState();
}

class AddTransactionScreenState extends State<AddTransactionScreen> {
  // GlobalKey untuk mengontrol form dan memicu validasi
  final _formKey = GlobalKey<FormState>();

  // Controller untuk mengambil teks dari input
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController(); // Controller untuk Tanggal

  // State untuk Dropdown
  String _selectedCategory = 'Makanan';
  final List<String> _categories = [
    'Makanan',
    'Transportasi',
    'Hiburan',
    'Lainnya',
  ];

  @override
  void dispose() {
    // Bersihkan controller saat halaman ditutup untuk mencegah memory leak
    _titleController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  // Fungsi untuk menampilkan DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        // Format tanggal ke DD/MM/YYYY
        _dateController.text =
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catat Transaksi Baru"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Input 1: Judul Transaksi
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Judul Transaksi",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Judul transaksi tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Input 2: Nominal Saldo
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Nominal (Rp)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nominal wajib diisi";
                  }
                  if (int.tryParse(value) == null) {
                    return "Harus berupa angka bulat yang valid";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Input 3: Kategori Dropdown
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: "Kategori",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Input 4: Tanggal Transaksi (Tugas/Latihan)
              TextFormField(
                controller: _dateController,
                readOnly: true, // Mencegah keyboard bawaan muncul
                decoration: const InputDecoration(
                  labelText: "Tanggal Transaksi (DD/MM/YYYY)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _selectDate(context), // Memanggil DatePicker saat diklik
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tanggal transaksi wajib diisi";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Tombol Simpan
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Tersimpan: ${_titleController.text} (Rp ${_amountController.text}) pada ${_dateController.text}',
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                child: const Text(
                  "Simpan Transaksi",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
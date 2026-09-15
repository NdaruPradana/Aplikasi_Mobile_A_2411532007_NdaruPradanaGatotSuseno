
void main() {
  // Membuat objek Persegi
  Persegi persegi = Persegi(5);
  print('Luas persegi = ${persegi.hitungLuas()}');

  // Membuat objek Lingkaran
  Lingkaran lingkaran = Lingkaran(7);
  print('Luas lingkaran = ${lingkaran.hitungLuas()}');

  // Membuat objek Kubus
  Kubus kubus = Kubus(4);
  print('Volume kubus = ${kubus.hitungVolume()}');

  // Membuat objek Balok
  Balok balok = Balok(10, 5, 3);
  print('Volume balok = ${balok.hitungVolume()}');
}

// Class untuk Persegi
class Persegi {
  double sisi;

  Persegi(this.sisi);

  double hitungLuas() {
    return sisi * sisi;
  }
}

// Class untuk Lingkaran
class Lingkaran {
  double jariJari;

  Lingkaran(this.jariJari);

  double hitungLuas() {
    return 3.14 * jariJari * jariJari;
  }
}

// Class untuk Kubus
class Kubus {
  double sisi;

  Kubus(this.sisi);

  double hitungVolume() {
    return sisi * sisi * sisi;
  }
}

// Class untuk Balok
class Balok {
  double panjang;
  double lebar;
  double tinggi;

  Balok(this.panjang, this.lebar, this.tinggi);

  double hitungVolume() {
    return panjang * lebar * tinggi;
  }
}

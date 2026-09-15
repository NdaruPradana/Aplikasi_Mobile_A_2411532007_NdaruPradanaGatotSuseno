
import 'dart:io';

void main() {
  print('=== PROGRAM MENGHITUNG BANGUN ===');

  print('\n--- LUAS PERSEGI ---');
  stdout.write('Masukkan sisi: ');
  double sisi = double.parse(stdin.readLineSync()!);

  double luasPersegi = sisi * sisi;
  print('Luas persegi = $luasPersegi');

  print('\n--- LUAS LINGKARAN ---');
  stdout.write('Masukkan jari-jari: ');
  double r = double.parse(stdin.readLineSync()!);

  double luasLingkaran = 3.14 * r * r;
  print('Luas lingkaran = $luasLingkaran');

  print('\n--- VOLUME KUBUS ---');
  stdout.write('Masukkan sisi: ');
  double sisiKubus = double.parse(stdin.readLineSync()!);

  double volumeKubus = sisiKubus * sisiKubus * sisiKubus;
  print('Volume kubus = $volumeKubus');

  print('\n--- VOLUME BALOK ---');
  stdout.write('Masukkan panjang: ');
  double panjang = double.parse(stdin.readLineSync()!);

  stdout.write('Masukkan lebar: ');
  double lebar = double.parse(stdin.readLineSync()!);

  stdout.write('Masukkan tinggi: ');
  double tinggi = double.parse(stdin.readLineSync()!);

  double volumeBalok = panjang * lebar * tinggi;
  print('Volume balok = $volumeBalok');
}


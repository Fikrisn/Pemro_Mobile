void main() {
  // Menggunakan tuple sederhana dengan nama dan NIM Anda
  var record = (2241760105, 1); // Tukar elemen untuk cocok dengan (int, int) yang digunakan di tukar()
  print('Original record: $record');

  var swapped = tukar(record);
  print('Swapped record: $swapped');

  // Menginisialisasi variabel mahasiswa menggunakan kelas
  var mahasiswa = Mahasiswa('Moch Fikri Setiawan', 2241760105);
  print(mahasiswa);

  // Menginisialisasi variabel mahasiswa2 menggunakan kelas dengan named fields
  var mahasiswa2 = MahasiswaNamed('first', 2, true, 'last');
  print(mahasiswa2.first); // Prints 'first'
  print(mahasiswa2.middle); // Prints 2
  print(mahasiswa2.flag); // Prints true
  print(mahasiswa2.last); // Prints 'last'
}

// Fungsi tukar untuk tuple (int, int)
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

// Kelas untuk variabel mahasiswa
class Mahasiswa {
  final String name;
  final int nim;

  Mahasiswa(this.name, this.nim);

  @override
  String toString() => '($name, $nim)';
}

// Kelas untuk variabel mahasiswa2 dengan named fields
class MahasiswaNamed {
  final String first;
  final int middle;
  final bool flag;
  final String last;

  MahasiswaNamed(this.first, this.middle, this.flag, this.last);
}



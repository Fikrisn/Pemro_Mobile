void main() {
  String nama = "Moch Fikri Setiawan";
  String nim = "2241760105";

  // Loop untuk mencari bilangan prima dari 0 hingga 201
  for (int i = 2; i <= 201; i++) {
    if (isPrime(i)) {
      print("Bilangan prima: $i");
      print("Nama: $nama, NIM: $nim\n");
    }
  }
}

// Fungsi untuk mengecek apakah sebuah bilangan adalah bilangan prima
bool isPrime(int number) {
  if (number < 2) return false;
  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) return false;
  }
  return true;
}

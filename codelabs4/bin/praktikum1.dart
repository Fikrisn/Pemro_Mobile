// void main() {
//   var list = [1, 2, 3];
//   assert(list.length == 3);
//   assert(list[1] == 2);
//   print(list.length);
//   print(list[1]);

//   list[1] = 1;
//   assert(list[1] == 1);
//   print(list[1]);
// }



void main() {
  final List<dynamic> list = List.filled(5, null); // Membuat list dengan 5 elemen default null dan tipe dynamic
  list[1] = 'Moch Fikri Setiawan';   // Mengisi indeks ke-1
  list[2] = '2241760105';            // Mengisi indeks ke-2

  assert(list.length == 5);          // Memastikan panjang list adalah 5
  assert(list[1] == 'Moch Fikri Setiawan'); // Memastikan elemen pada indeks 1 benar
  assert(list[2] == '2241760105');    // Memastikan elemen pada indeks 2 benar
  
  print(list.length);                 // Mencetak panjang list
  print(list[1]);                     // Mencetak elemen indeks ke-1
  print(list[2]);                     // Mencetak elemen indeks ke-2
  print(list);                        // Mencetak seluruh isi list
}

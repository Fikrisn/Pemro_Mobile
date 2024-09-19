void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {};
  var names3 = <String>{}; // Mengubah menjadi Set<String>

  // Menambahkan nama dan NIM dengan .add() pada names1
  names1.add('Moch Fikri Setiawan');
  names1.add('2241760105');

  // Menambahkan nama dan NIM dengan .addAll() pada names2
  names2.addAll({'Moch Fikri Setiawan', '2241760105'});

  print(names1);
  print(names2);
  print(names3);
}


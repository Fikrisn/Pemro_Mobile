void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings', // Pastikan semua nilai adalah String
    'name': 'Moch Fikri Setiawan',
    'nim': '2241760105',
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon', // Pastikan semua nilai adalah String
    20: 'Moch Fikri Setiawan', // Menambahkan elemen dengan key baru
    30: '2241760105',          // Menambahkan elemen dengan key baru
  };

  print(gifts);
  print(nobleGases);
  
  var mhs1 = Map<String, String>();
  mhs1['first'] = 'partridge';
  mhs1['second'] = 'turtledoves';
  mhs1['fifth'] = 'golden rings';
  mhs1['name'] = 'Moch Fikri Setiawan';
  mhs1['nim'] = '2241760105';

  var mhs2 = Map<int, String>();
  mhs2[2] = 'helium';
  mhs2[10] = 'neon';
  mhs2[18] = 'argon';
  mhs2[20] = 'Moch Fikri Setiawan'; // Menambahkan elemen dengan key baru
  mhs2[30] = '2241760105';         // Menambahkan elemen dengan key baru

  print(mhs1);
  print(mhs2);
}

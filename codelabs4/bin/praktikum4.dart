void main() {
  var list = [1, 2, 3];
  var list2 = [0, ...list];

  print(list);
  print(list2);
  print(list2.length);

  var list1 = [1, 2, null];
  print(list1);
  var list3 = [0, ...list1]; // Menggunakan ...? untuk mengizinkan nilai null
  print(list3.length);

  // Menambahkan variabel list yang berisi NIM Anda
  var nimList = [2241760105];
  var combinedList = [...list, ...nimList];
  print(combinedList);

  // Mendefinisikan variabel promoActive
  bool promoActive = true; // Set sesuai kebutuhan, true atau false

  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  // Mendefinisikan variabel login dengan nilai yang sesuai
  String login = 'Manager'; // Set sesuai kebutuhan, misalnya 'Manager'

  var nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  print(nav2);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}

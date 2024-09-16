import 'dart:io';

void main() {
  int i, j, nilai, jmlsmt, jmlmk = 0, jumlahnilai, jumlahsks = 0, totalsks = 0;
  List<List<int>> sks = List.generate(14, (_) => List.filled(30, 0));
  List<int> skssmt = List.filled(14, 0);
  List<double> nr = List.filled(14, 0.0);
  double totalnr = 0.0, ipk;
  List<List<String>> matkul = List.generate(14, (_) => List.filled(30, ''));
  List<List<String>> nilaihuruf = List.generate(14, (_) => List.filled(30, ''));

  print("==============================================");
  print("\tProgram Menghitung IPK Mahasiswa");
  print("==============================================");

  stdout.write("Masukkan jumlah semester: ");
  jmlsmt = int.parse(stdin.readLineSync()!);

  if (jmlsmt < 2 || jmlsmt > 14) {
    print("Jumlah semester salah!");
    return;
  } else {
    for (i = 0; i < jmlsmt; i++) {
      jumlahnilai = 0;
      jumlahsks = 0;
      stdout.write("Masukkan jumlah mata kuliah semester ${i + 1}: ");
      jmlmk = int.parse(stdin.readLineSync()!);
      if (jmlmk < 2) {
        print("Jumlah matakuliah kurang dari 2 setiap semester");
        return;
      } else {
        for (j = 0; j < jmlmk; j++) {
          print("Masukkan mata kuliah ke ${j + 1}");
          stdout.write("Masukkan nama matkul: ");
          matkul[i][j] = stdin.readLineSync()!;
          stdout.write("Masukkan jumlah sks matkul: ");
          sks[i][j] = int.parse(stdin.readLineSync()!);
          stdout.write("Masukkan nilai matkul: ");
          nilaihuruf[i][j] = stdin.readLineSync()!;
          print("--------------------------------------------");

          switch (nilaihuruf[i][j]) {
            case 'A':
              nilai = 4 * sks[i][j];
              break;
            case 'B':
              nilai = 3 * sks[i][j];
              break;
            case 'C':
              nilai = 2 * sks[i][j];
              break;
            case 'D':
              nilai = 1 * sks[i][j];
              break;
            case 'E':
              nilai = 0 * sks[i][j];
              break;
            default:
              print("Input salah!");
              return;
          }
          jumlahnilai += nilai;
          jumlahsks += sks[i][j];
        }
        if (jumlahsks > 24) {
          print("Jumlah SKS semester lebih dari 24");
          return;
        } else {
          skssmt[i] = jumlahsks;
          nr[i] = jumlahnilai / jumlahsks.toDouble();
        }
      }
    }
  }

  print("==============================================");
  print("\t\tTranskrip Nilai");
  print("==============================================");
  for (i = 0; i < jmlsmt; i++) {
    print("\nHasil Semester ${i + 1}:");
    print("${'Mata Kuliah'.padRight(20)}${'SKS'.padRight(10)}${'Nilai'}");
    for (j = 0; j < jmlmk; j++) {
      print("${matkul[i][j].padRight(20)}${sks[i][j].toString().padRight(10)}${nilaihuruf[i][j]}");
    }
    print("\n\nSKS\t: ${skssmt[i]}");
    print("NR\t: ${nr[i].toStringAsFixed(2)}");
    totalsks += skssmt[i];
    totalnr += nr[i];
    print("--------------------------------------------");
  }
  ipk = totalnr / jmlsmt;
  print("\nTotal SKS\t: ${totalsks}");
  print("IPK\t\t: ${ipk.toStringAsFixed(2)}");
  print("==============================================");
}

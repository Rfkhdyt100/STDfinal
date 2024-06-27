import 'dart:io';

enum StatusKehadiran { hadir, sakit, ijin, alfa }

class Siswa {
  int nomorAbsen;
  String nama;
  StatusKehadiran? status;
  String? mataKuliah;
  DateTime? tanggal;

  Siswa(this.nomorAbsen, this.nama, {this.mataKuliah, this.tanggal});
}

class DaftarAbsensi {
  List<Siswa> daftarSiswa = [];
  Set<int> nomorAbsenSet = {};

  void tambahSiswa(Siswa siswa) {
    daftarSiswa.add(siswa);
  }

  // Searching berdasarkan nomor
  Siswa? cariBerdasarkanNomor(int nomor) {
    try {
      return daftarSiswa.firstWhere((siswa) => siswa.nomorAbsen == nomor);
    } catch (e) {
      return null;
    }
  }

  // Searching berdasarkan nama
  Siswa? cariBerdasarkanNama(String nama) {
    try {
      return daftarSiswa.firstWhere(
          (siswa) => siswa.nama.toLowerCase() == nama.toLowerCase());
    } catch (e) {
      return null;
    }
  }

  void cetakDaftar() {
    for (var siswa in daftarSiswa) {
      var status = siswa.status?.toString().split('.').last ?? 'belum absen';
      print('Nomor absen ${siswa.nomorAbsen}: ${siswa.nama} - $status');
      print(
          '----------------------------------------------------------------------------------');
    }
    if (daftarSiswa.isNotEmpty) {
      print('Mata Kuliah: ${daftarSiswa.first.mataKuliah}');
      print('Tanggal: ${daftarSiswa.first.tanggal?.toString().split(' ')[0]}');
    }
  }

  void tambahJadwal(Siswa siswa, {String? mataKuliah, DateTime? tanggal}) {
    if (!nomorAbsenSet.contains(siswa.nomorAbsen)) {
      siswa.mataKuliah = mataKuliah;
      siswa.tanggal = tanggal;
      daftarSiswa.add(siswa);
      nomorAbsenSet.add(siswa.nomorAbsen); // fungsi set pada nomor absen
    } else {
      print(
          'Nomor absen ${siswa.nomorAbsen} sudah ada.'); // muncul setelah ada nomor absen yang sama
    }
  }
}

void bubbleSortNomorAbsen(List<Siswa> list) {
  for (var i = 0; i < list.length; i++) {
    for (var j = 0; j < list.length - i - 1; j++) {
      if (list[j].nomorAbsen > list[j + 1].nomorAbsen) {
        var temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
}

class Node {
  Siswa data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;

  void add(Siswa data) {
    if (head == null) {
      head = Node(data);
    } else {
      var current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = Node(data);
    }
  }

  void printList() {
    var current = head;
    while (current != null) {
      print('Nomor absen ${current.data.nomorAbsen}: ${current.data.nama}');
      current = current.next;
    }
  }
}

void main() {
  var daftarAbsensi = DaftarAbsensi();

  // Keterangan absensi
  print('ABSENSI KELAS 1D TRPL');
  print(
      '===========================================================================================================================================');
  print('Tata cara Absensi:');
  print('   1.  Masukkan mata kuliah/pelajaran');
  print(
      '   2.  Masukkan Tanggal dimulai dari hari/bulan/tahun, sambungkan dengan garis miring');
  print(
      '   3.  Masukkan nomor absen atau nama siswa dan kehadiran(hadir, sakit, ijin, alfa), pisahkan dengan SPASI.');
  print(
      '        Contoh: 1 sakit, 2 ijin, NOMOR dapat di multiple seperti 1,2,3,4 atau NamaLengkap saja maka dianggap Hadir.');
  print('   4.  Masukkan "selesai" untuk mengakhiri sesi absensi.');
  print(
      '===========================================================================================================================================');

  print('Masukkan nama mata kuliah:');
  var mataKuliah = stdin.readLineSync();

  print('Masukkan tanggal absensi (DD/MM/YYYY):');
  var inputTanggal = stdin.readLineSync();
  DateTime? tanggal;
  if (inputTanggal != null) {
    var parts = inputTanggal.split('/');
    if (parts.length == 3) {
      var day = int.tryParse(parts[0]);
      var month = int.tryParse(parts[1]);
      var year = int.tryParse(parts[2]);
      if (day != null && month != null && year != null) {
        tanggal = DateTime(year, month, day);
      }
    }
  }

  // Data siswa/siswi
  daftarAbsensi.tambahJadwal(Siswa(1, 'Anisatu Hasanah'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(2, 'Legar Suryantara'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(3, 'Nur Ardina Anzilia Putri'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(4, 'Adfal Eriko Febrian Pratama'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(5, 'Ahmad Diki Darmawan'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(6, 'Dani Daneswara'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(7, 'Lipiya Agustina'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(8, 'Hendi Hardianto'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(9, 'Jasmine Az Zahra Ihsani'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(10, 'Rifki Hidayat'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(11, 'Ella Dwi Maulina'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(12, 'Muhammad Ismatullah Shadqi Sukoco'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(13, 'Fariz Ali Muhaimin'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(14, 'Octavio Ellen Hariadi'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(15, 'M Dhika Maulana Hariadi'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(16, 'Moh Andra Ariesfi'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(17, 'Celvin Alfiansyah'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(18, 'Early Alfa Sheilawati'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(19, 'Fitri Ayu Wulan Sari'),
      mataKuliah: mataKuliah, tanggal: tanggal);
  daftarAbsensi.tambahJadwal(Siswa(20, 'Wahyu Laksono Saputra'),
      mataKuliah: mataKuliah, tanggal: tanggal);

  // Untuk menginput nama/absen yang sudah ada
  while (true) {
    print('Masukkan nomor absen/nama dan kehadiran :');
    var input = stdin.readLineSync();

    // Mengakhiri proses Looping yang terjadi
    if (input == null || input.toLowerCase() == 'selesai') {
      print('Sesi absensi diakhiri.');
      break;
    }

    var inputs = input.split(',').map((e) => e.trim()).toList();

    for (var singleInput in inputs) {
      var parts = singleInput.split(' ');
      var nomor = int.tryParse(parts[0]);
      var statusInput = parts.length > 1 ? parts[1].toLowerCase() : '';

      StatusKehadiran? status;

      switch (statusInput) {
        case 'sakit':
          status = StatusKehadiran.sakit;
          break;
        case 'ijin':
          status = StatusKehadiran.ijin;
          break;
        case 'alfa':
          status = StatusKehadiran.alfa;
          break;
        default:
          status = StatusKehadiran.hadir;
          break;
      }

      if (nomor != null) {
        var siswa = daftarAbsensi.cariBerdasarkanNomor(nomor);

        if (siswa != null) {
          siswa.status = status;

          switch (status) {
            case StatusKehadiran.hadir:
              print(
                  'Siswa hadir: ${siswa.nama} dengan nomor absen ${siswa.nomorAbsen}');
              break;
            case StatusKehadiran.sakit:
              print(
                  'Siswa sakit: ${siswa.nama} dengan nomor absen ${siswa.nomorAbsen}');
              break;
            case StatusKehadiran.ijin:
              print(
                  'Siswa ijin: ${siswa.nama} dengan nomor absen ${siswa.nomorAbsen}');
              break;
            case StatusKehadiran.alfa:
              print(
                  'Siswa alfa: ${siswa.nama} dengan nomor absen ${siswa.nomorAbsen}');
              break;
          }
        } else {
          print('Nomor absen tidak ditemukan.');
        }
      } else {
        var siswaNama =
            parts.join(' '); // Menggabungkan kembali nama yang mungkin terpisah
        var siswa = daftarAbsensi.cariBerdasarkanNama(siswaNama);

        if (siswa != null) {
          siswa.status = status;

          switch (status) {
            case StatusKehadiran.hadir:
              print('Siswa hadir: ${siswa.nama}');
              break;
            case StatusKehadiran.sakit:
              print('Siswa sakit: ${siswa.nama}');
              break;
            case StatusKehadiran.ijin:
              print('Siswa ijin: ${siswa.nama}');
              break;
            case StatusKehadiran.alfa:
              print('Siswa alfa: ${siswa.nama}');
              break;
          }
        } else {
          print('Nama siswa tidak ditemukan.');
        }
      }
    }
  }

  // cetak absensi setelah selesai
  bubbleSortNomorAbsen(daftarAbsensi.daftarSiswa);
  daftarAbsensi.cetakDaftar();
}

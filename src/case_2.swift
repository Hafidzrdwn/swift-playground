/*
SOAL 2
Tema: Sistem Verifikasi Platform Magang
Target: Penanganan nil (Optionals), if let atau guard let.

Tugas:
Di sebuah platform manajemen magang, tidak semua mahasiswa sudah memiliki nilai pre-test. Buat fungsi bernama cekStatusMagang yang menerima dua parameter:
  - namaKandidat (String)
  - nilaiPreTest (Optional Integer -> Int?)

Aturan logika:
  Jika nilainya kosong (nil), cetak: "Data tidak lengkap. [Nama] harus mengikuti pre-test terlebih dahulu."
  Jika nilainya ada, cek:
  - Jika nilai < 70, cetak: "Mohon maaf [Nama], kamu belum lolos seleksi."
  - Jika nilai >= 70, cetak: "Selamat [Nama]! Kamu diterima sebagai Full-Stack Intern."

Kriteria Sukses:
Kode tidak boleh error atau crash saat fungsi dipanggil dengan parameter nilaiPreTest: nil. Kamu wajib melakukan unwrapping yang aman.
*/

func cekStatusMagang(namaKandidat: String, nilaiPreTest: Int?) -> String {
  if let nilai = nilaiPreTest {
    if nilai < 70 {
        return "Mohon maaf \(namaKandidat), kamu belum lolos seleksi."
    } else {
        return "Selamat \(namaKandidat)! Kamu diterima sebagai Full-Stack Intern."
    }
  } else {
    return "Data tidak lengkap. \(namaKandidat) harus mengikuti pre-test terlebih dahulu."
  }
}
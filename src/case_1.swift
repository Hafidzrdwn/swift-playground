/* 
SOAL 1
Tema: Kalkulator Kasir Laundry Sepatu
Target: Fungsi, Control Flow dasar, dan Tipe Data.

Tugas:
Buat sebuah fungsi bernama hitungBiayaCuci yang menerima dua parameter:
    jumlahSepatu (Integer)
    jenisTreatment (String)

Aturan harga:
  - Jika treatment "Deep Clean", harganya Rp 50.000 per pasang.
  - Jika treatment "Fast Clean", harganya Rp 30.000 per pasang.
  - Jika pelanggan mencuci lebih dari 3 pasang sepatu, berikan diskon total sebesar 10%.

Kriteria Sukses:
Ketika fungsi dipanggil dengan hitungBiayaCuci(jumlahSepatu: 4, jenisTreatment: "Deep Clean"), program harus me-return (atau mem-print) angka 180000. 
*/

func hitungBiayaCuci(jumlahSepatu: Int, jenisTreatment: String) -> Int {
  let priceRule: Dictionary<String,Int> = [
    "deep clean": 50000,
    "fast clean": 30000
  ]

  guard let price = priceRule[jenisTreatment.lowercased()] else {
    return 0
  }

  let total = price * jumlahSepatu
  let discount = jumlahSepatu > 3 ? 0.1 : 0.0

  return Int(Double(total) * (1 - discount))
}

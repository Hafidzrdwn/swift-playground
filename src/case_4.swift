/*
Tema: Antrean Pemrosesan Data Array
Target: Perbedaan Value Type (struct) vs Reference Type (class), manipulasi Array.

Tugas:
  - Buat sebuah struct bernama Task yang memiliki properti judul (String) dan isSelesai (Boolean).
  - Buat sebuah class bernama TaskPipeline yang memiliki properti daftarTask (berisi Array dari Task).
  - Buat dua method di dalam TaskPipeline:
    - tambahTask(judul: String): Memasukkan Task baru ke dalam array dengan status isSelesai = false.
    - selesaikanSemua(): Melakukan looping ke seluruh array daftarTask dan mengubah status isSelesai menjadi true untuk semuanya.

Clue/Jebakan: Karena Task adalah sebuah struct (Value Type), kamu tidak bisa begitu saja mengubah nilainya di dalam looping standar (for item in array). Kamu butuh pendekatan khusus untuk memodifikasi elemen array struct di Swift.

Kriteria Sukses:
Array di dalam class berhasil diubah state-nya dan saat di-print, semua Task menampilkan isSelesai = true.
*/

struct Task {
  var judul: String
  var isSelesai: Bool
}

class TaskPipeline {
  var daftarTask: [Task] = []
  
  func tambahTask(judul: String) {
    let taskBaru = Task(judul: judul, isSelesai: false)
    daftarTask.append(taskBaru)
  }
  
  func selesaikanSemua() {
    for index in daftarTask.indices {
      daftarTask[index].isSelesai = true
    }
  }
}
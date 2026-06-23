/*
Tema: Manajemen Infrastruktur Server
Target: OOP, Class, Initialization (init), dan override method.

Tugas:
    Buat sebuah class induk bernama Server.
    - Punya properti ipAddress (String) dan isOnline (Boolean, default-nya false).
    - Punya method jalankan() yang mengubah isOnline menjadi true dan mencetak "Server [ipAddress] sekarang online."

    Buat class turunan bernama DatabaseServer yang mewarisi Server.
    - Tambahkan properti baru dbEngine (String, misalnya "MongoDB" atau "Redis").
    - Override method jalankan() sehingga mencetak "Server [ipAddress] online. Menginisialisasi koneksi [dbEngine] tanpa autentikasi..." (Pastikan memanggil method induk atau mengubah state isOnline di dalamnya).

Kriteria Sukses:
Instansiasi class DatabaseServer, panggil method jalankan(), dan pastikan teks override yang keluar beserta status isOnline yang berubah menjadi true.
*/

class Server {
    var ipAddress: String
    var isOnline: Bool = false
    
    init(ipAddress: String) {
      self.ipAddress = ipAddress
    }
    
    func jalankan() -> String {
      self.isOnline = true
      return "Server \(ipAddress) sekarang online."
    }
}

class DatabaseServer: Server {
  var dbEngine: String
  
  init(ipAddress: String, dbEngine: String) {
    self.dbEngine = dbEngine
    super.init(ipAddress: ipAddress)
  }
  
  override func jalankan() -> String {
    self.isOnline = true
    return "Server \(ipAddress) online. Menginisialisasi koneksi \(dbEngine) tanpa autentikasi..."
  }
}
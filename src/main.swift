import Foundation

struct TestRunner {
    static var totalTests = 0
    static var passedTests = 0
    
    static func runTest<T: Equatable>(name: String, result: @autoclosure () -> T, expected: T) {
        totalTests += 1
        print("Menjalankan: \(name)...", terminator: " ")
        
        let actual = result()
        
        if actual == expected {
            passedTests += 1
            print("\u{001B}[32m[PASS]\u{001B}[0m") 
        } else {
            print("\u{001B}[31m[FAIL]\u{001B}[0m") 
            print("   ↳ Expected: \(expected)")
            print("   ↳ Got     : \(actual)")
        }
    }
    
    static func finish() {
        print("\n========================================")
        let color = passedTests == totalTests ? "\u{001B}[32m" : "\u{001B}[33m"
        print("\(color)HASIL AKHIR: \(passedTests)/\(totalTests) Test Berhasil!\u{001B}[0m")
        if passedTests == totalTests {
            print("Luar biasa! Semua logika sudah sempurna.")
        } else {
            print("Masih ada yang fail atau belum dikerjakan. Coba lagi!")
        }
        print("========================================\n")
    }
}

print("\nMEMULAI AUTOGRADER SWIFT...\n")

// Eksekusi Level 1
TestRunner.runTest(name: "Level 1.1: Deep Clean tanpa diskon", result: hitungBiayaCuci(jumlahSepatu: 2, jenisTreatment: "Deep Clean"), expected: 100000)
TestRunner.runTest(name: "Level 1.2: Fast Clean dengan diskon", result: hitungBiayaCuci(jumlahSepatu: 4, jenisTreatment: "Fast Clean"), expected: 108000) // (30000 * 4) - 10%

// Eksekusi Level 2
TestRunner.runTest(name: "Level 2.1: Nilai nil (Kosong)", result: cekStatusMagang(namaKandidat: "Budi", nilaiPreTest: nil), expected: "Data tidak lengkap. Budi harus mengikuti pre-test terlebih dahulu.")
TestRunner.runTest(name: "Level 2.2: Nilai kurang dari 70", result: cekStatusMagang(namaKandidat: "Andi", nilaiPreTest: 65), expected: "Mohon maaf Andi, kamu belum lolos seleksi.")
TestRunner.runTest(name: "Level 2.3: Nilai lebih dari 70", result: cekStatusMagang(namaKandidat: "Siti", nilaiPreTest: 85), expected: "Selamat Siti! Kamu diterima sebagai Full-Stack Intern.")

// Eksekusi Level 3
let baseServer = Server(ipAddress: "192.168.1.1")
TestRunner.runTest(name: "Level 3.1: Base Server logic", result: baseServer.jalankan(), expected: "Server 192.168.1.1 sekarang online.")
TestRunner.runTest(name: "Level 3.2: State berubah jadi online", result: baseServer.isOnline, expected: true)

let dbServer = DatabaseServer(ipAddress: "127.0.0.1", dbEngine: "MongoDB")
TestRunner.runTest(name: "Level 3.3: Database Server Override", result: dbServer.jalankan(), expected: "Server 127.0.0.1 online. Menginisialisasi koneksi MongoDB tanpa autentikasi...")
TestRunner.runTest(name: "Level 3.4: DB state berubah", result: dbServer.isOnline, expected: true)

// Eksekusi Level 4
let pipeline = TaskPipeline()
pipeline.tambahTask(judul: "Setup Docker")
pipeline.tambahTask(judul: "Belajar Swift")
TestRunner.runTest(name: "Level 4.1: Tambah Task", result: pipeline.daftarTask.count, expected: 2)
TestRunner.runTest(name: "Level 4.2: Status default false", result: pipeline.daftarTask[0].isSelesai, expected: false)
pipeline.selesaikanSemua()
TestRunner.runTest(name: "Level 4.3: Semua Task Selesai (Struct Mutation)", result: pipeline.daftarTask[1].isSelesai, expected: true)

// Eksekusi Level 5
let pEngine = PromptEngine()
let vibe = VibeCoder(engine: .gemini, promptData: pEngine)

TestRunner.runTest(name: "Level 5.1: Generate tanpa prompt", result: vibe.generateCode(), expected: "Vibe coding gagal: Prompt belum diisi")

pEngine.tambahPrompt("Buat fungsi login")
pEngine.tambahPrompt("Gunakan JWT")
TestRunner.runTest(name: "Level 5.2: Generate dengan prompt & history tergabung", result: vibe.generateCode(), expected: "Mengirimkan context: 'Buat fungsi login, Gunakan JWT' ke engine gemini... Menghasilkan kode boilerplate!")

TestRunner.finish()
/*
Tema: Simulasi Engine "Vibe Coding"
Target: Integrasi end-to-end, Enum, Error Handling (Opsional), dan komposisi Class.

Tugas:
Gabungkan semua materi menjadi satu ekosistem:
  - Buat sebuah enum bernama AIProvider yang isinya gemini, chatgpt, dan claude.
  - Buat class bernama PromptEngine yang menyimpan history teks prompt dalam bentuk Array of String. Punya method tambahPrompt(_ teks: String).

  - Buat class bernama VibeCoder.
    - Menerima injeksi AIProvider dan PromptEngine melalui init.
    - Punya method generateCode().
    - Logika generateCode: Jika history prompt di PromptEngine kosong (cek array empty), cetak "Vibe coding gagal: Prompt belum diisi". Jika ada isinya, gabungkan seluruh isi array prompt tersebut dan cetak "Mengirimkan context: '[isi_prompt]' ke engine [AIProvider]... Menghasilkan kode boilerplate!"

Kriteria Sukses:
Kode sangat modular. Masing-masing class tidak saling tumpang tindih fungsinya, instansiasi dilakukan secara berurutan, dan memunculkan output yang terangkai menjadi satu alur sistem vibe coding simulasi.
*/

enum AIProvider {
  case gemini
  case chatgpt
  case claude
}

class PromptEngine {
  var historyPrompt: [String] = []
  
  func tambahPrompt(_ teks: String) {
    historyPrompt.append(teks)
  }
}

class VibeCoder {
  let engine: AIProvider
  let promptData: PromptEngine
  
  init(engine: AIProvider, promptData: PromptEngine) {
    self.engine = engine
    self.promptData = promptData
  }
  
  func generateCode() -> String {
    if promptData.historyPrompt.isEmpty {
      return "Vibe coding gagal: Prompt belum diisi"
    } else {
      let mergePrompt = promptData.historyPrompt.joined(separator: ", ")
      return "Mengirimkan context: '\(mergePrompt)' ke engine \(engine)... Menghasilkan kode boilerplate!"
    }
  }
}
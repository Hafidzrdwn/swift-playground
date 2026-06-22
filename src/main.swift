// print("Hello World from Swift!!")

// let gender = "Laki-laki"

// var firstName = "Hafidz"
// var lastName = "Ridwan Cahya"
// var age: Int = 21

// print("Namaku \(firstName) \(lastName), aku adalah seorang \(gender) berumur \(age) tahun.")

// let pi: Double = 3.14
// print("Nilai PHI adalah \(pi)")

// // Optionals, null = nil
// var namaUser: String = "Budi"
// // namaUser = nil // ERROR! String biasa tidak boleh nil

// var umurUser: Int? = 20  // Int? artinya "Bisa Int, bisa nil"
// umurUser = nil           // Ini valid
// print("Umur User : \(umurUser ?? 21)")

// // Unwrap variabel opsional
// var hobi: String? = nil

// // Swift akan mengecek: Jika 'hobi' tidak nil, masukkan nilainya ke 'hobiPasti'
// if let hobiPasti = hobi {
//     print("Hobi user adalah \(hobiPasti)")
// } else {
//     print("User belum mengisi hobi")
// }

// // semicolons and blocks
// // let a = 1; let b = 2

// // print on one line
// // for n in 1...3 {
// //   print(n, terminator: " ")
// // }

// // Math Functions
// // let x = -7
// // print(abs(x))
// // print(min(5,25))
// // print(max(300, 245))

// // Multiple Variables
// var x = 1, y = 2, z = 3
// let a = 10, b = 20
// print(x, y, z, a, b, separator: ", ", terminator: ".\n")

// // String and Char
// let inisial: Character = "H"
// let fullName = "Hakim Dwi"
// print("Panjang karakter (\(fullName)): \(fullName.count) Karakter")

// // Upcasting and Downcasting
// print("\n UPCASTING AND DOWNCASTING\n====================")
// let items: [Any] = [1, "Swift", 3.14, true]
// for item in items {
//   if let i = item as? Int {
//     print("Int: \(i)")
//   } else if let s = item as? String {
//     print("String: \(s)")
//   } else {
//     print("Nilai lain: \(item)")
//   }
// }

// // Forced Downcast
// print("\n FORCED DOWNCASTING\n====================")
// let value: Any = 42
// let i = value as! Int   // forced downcast, akan error kalo bukan Int
// print(i)

// print("\n")

// // Strings
// // count, isEmpty
// var job = ""
// print("Punya kerjaan? \((!job.isEmpty) ? "Ya, punya." : "Pengangguran.")")

// // Substring and Case
// let text = "Swift"
// let start = text.startIndex
// let end = text.index(start, offsetBy: 4)
// let sub = text[start..<end]  // "Swi"
// print(sub)
// print(text.uppercased())
// print(text.lowercased())

// // string to number
// let s1 = "123"
// let n1 = Int(s1) 
// print(n1 ?? 0)
// print(n1 == nil) // if contains not number

// print("\n Arrays\n====================")
// let fruits = ["Apple", "Banana", "Cherry"]
// for fruit in fruits {
//   print(fruit)
// }
// // Get index and value with enumerated().
// for (i, fruit) in fruits.enumerated() {
//   print("\(i+1): \(fruit)")
// }

// // Foreach
// fruits.forEach { print($0) }
// fruits.enumerated().forEach { print("\($0.offset): \($0.element)") }


// let nums = [10, 20, 30, 40, 50]
// let slice = nums[1..<3]   // indices 1 and 2
// print("Nums: \(slice)")   // [20, 30]

// let arr = [0, 1, 2, 3, 4]
// print(arr[...2])  // first three elements (0...2)
// print(arr[2...])  // from index 2 to the end

// print("Last Element: \(arr.index(before: arr.endIndex))")

// // Aggregate and Transform
// let scores = [72, 88, 95, 64, 83]
// let passed = scores.filter { $0 >= 75 }
// let curved = passed.map { $0 + 5 }
// let average = curved.reduce(0, +) / curved.count
// print(passed)
// print(curved)
// print("Average: \(average)")

// // Search & Index
// let names = ["Kai", "Bjorn", "Stale"]
// print(names.contains("Bjorn"))            // true
// if let i = names.firstIndex(of: "Stale") {
//   print(i)                                 // 2
// }

// SET
// let groupA: Set<String> = ["Jo", "Silvi", "Budi", "Rahman"]
// let groupB: Set<String> = ["Rania", "Siti", "Budi", "Rasyid"]

// print("Union and Sorted: \(groupA.union(groupB).sorted())")
// print("Intersection and Sorted: \(groupA.intersection(groupB).sorted())")
// print("Subtracting and Sorted: \(groupA.subtracting(groupB).sorted())")

// DICTIONARIES
// let ages = ["Kai": 30, "Elisabeth": 25]
// for k in ages.keys.sorted() {
//   print("\(k): \(ages[k]!)")
// }

// SORT
// var nums = [3, 1, 2]
// let ascending = nums.sorted()
// print(ascending)      // [1, 2, 3]
// nums.sort(by: >)
// print(nums)           // [3, 2, 1]

// let names = ["bob", "Alice", "dave"]
// let caseInsensitive = names.sorted { $0.lowercased() > $1.lowercased() }
// print(caseInsensitive) // ["Alice", "bob", "dave"

print("\n Function\n====================")
// func sum(_ a: Int, _ b: Int) -> Int {
//   return a + b
// }

// var num1: Int = 40
// var num2: Int = 20

// print("Hasil penjumlahan dari \(num1) + \(num2) = \(sum(num1, num2))")

// func greeting(name: String, job: String) -> String {
//   return "Hello \(name) (\(job))!!"
// }

// print(greeting(name: "Hafidz", job: "Programmer"))

func test(_ n: Int, _ action: () -> Void) {
  for _ in 0..<n {
    action()
  }
}

func sayHello() {
  print("Halooo!!")
}

test(3, sayHello)
import Foundation


let numbers: Array<Int> = [
   1 , 2 , 3 , 4 , 5
]

if let _numberIndex = numbers.firstIndex(where: { (number: Int) in
   number == 1 }) {
   print("Number \(numbers[_numberIndex]) matches to 1.")
}


 let students = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]

if let _i = students.firstIndex(where: { (name: String) in
                                 name.hasPrefix("A") }) {
   print("\(students[_i]) starts with 'A'!")
}




/*
 let students = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]

 if let i = students.firstIndex(where: { $0.hasPrefix("A") }) {
     print("\(students[i]) starts with 'A'!")
 }
 */

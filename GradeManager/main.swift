import Foundation

protocol InputManagable {
    func readUserInput() -> String?
    func toStudent() -> Student?
}

protocol MenuManagable {
    var students: [Student] { get set }
    func run() -> Bool
    func add(student: Student)
    func delete(student: Student)
    func find(name: String)
}

struct Student {
    let name: String
}

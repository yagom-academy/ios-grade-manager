import Foundation

protocol InputManagable {
    func readUserInput() -> String?
    func toStudent() -> Student?
}

protocol MenuManagable {
    var students: Set<Student> { get set }
    func run() -> Bool
    func add(student: Student)
    func delete(student: Student)
    func find(name: String) -> Student?
}

struct Student {
    let name: String
}

extension Student: Hashable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name
    }
}

class InputManager: InputManagable {
    func readUserInput() -> String? {
        guard let userInput: String = readLine(), userInput != "" else { return nil }
        return userInput
    }
    
    func toStudent() -> Student? {
        guard let name: String = readUserInput() else { return nil }
        return Student(name: name)
    }
}

class MenuManager: MenuManagable {
    var students: Set<Student>
    var inputManager: InputManagable
    
    init(inputManager: InputManagable) {
        self.inputManager = inputManager
        self.students = Set<Student>()
    }

    func run() -> Bool { return true }
    
    func add(student: Student) {
        students.insert(student)
    }
    
    func delete(student: Student) {
        students.remove(student)
    }
    
    func find(name: String) -> Student? {
        let filtered: [Student] = students.filter({ ($0).name == name })
        if filtered.count == 0 {
            return nil
        }
        return filtered[0]
    }
}

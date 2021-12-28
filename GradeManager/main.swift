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
    func find(name: String)
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
        let userInput: String? = readLine()
        if userInput == nil || userInput == "" {
            return nil
        }
        return userInput
    }
    
    func toStudent() -> Student? {
        let name: String? = readUserInput()
        if name == nil {
            return nil
        }
        return Student(name: name ?? "")
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
    func add(student: Student) { }
    func delete(student: Student) { }
    func find(name: String) { }
}

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

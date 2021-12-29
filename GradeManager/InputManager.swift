import Foundation

protocol InputManagable {
    func readUserInput() -> String?
    func toStudent(message: String) -> Student?
    func toMenu() -> String?
}

class InputManager: InputManagable {
    func readUserInput() -> String? {
        guard let userInput: String = readLine(), userInput != "" else { return nil }
        return userInput
    }
    
    func toStudent(message: String) -> Student? {
        print(message)
        guard let name: String = readUserInput() else { return nil }
        return Student(name: name)
    }
    
    func toMenu() -> String? {
        guard let menu: String = readUserInput(), MenuManager.Command.isValid(input: menu)
        else { return nil }
        return menu
    }
}

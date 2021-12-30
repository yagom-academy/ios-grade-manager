import Foundation

protocol InputManagable {
    func readUserInput() -> String?
    func toStudent(message: String) -> Student?
    func toMenu() -> String?
    func toScore(message: String) -> [String]?
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
    
    func toScore(message: String) -> [String]? {
        print(message)
        guard let input: String = readUserInput() else { return nil }
        let splitted = input.split(separator: " ").map{String.init($0)}
        return splitted
    }
}

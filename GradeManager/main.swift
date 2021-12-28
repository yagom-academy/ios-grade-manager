import Foundation

protocol InputManagable {
    func readUserInput() -> String?
    func toStudent(message: String) -> Student?
    func toMenu() -> String?
}

protocol MenuManagable {
    var students: Set<Student> { get set }
    func run() -> Bool
    func add(student: Student?)
    func delete(student: Student?)
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

class MenuManager: MenuManagable {
    enum Command: String, CaseIterable {
        case studentAdd = "1", studentDelete = "2", gradeAdd = "3", gradeDelete = "4", show = "5", end = "X"
        static var range: ClosedRange<Int> {
            let numbers = Self.allCases.compactMap({Int.init($0.rawValue)})
            return (numbers.min() ?? 0)...(numbers.max() ?? 0)
        }
        
        static func isValid(input: String) -> Bool {
            return (Self.range ~= Int(input) ?? 0) || (input == Self.end.rawValue)
        }
    }
    
    enum Behavior {
        case menu, wrongMenu, needAddName, needDeleteName, wrongInput, nameExist(Student), noStudent(Student), addedStudent(Student), deletedStudent(Student), programEnd
        
        var output: String {
            switch self {
            case .menu:
                return "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
            case .wrongMenu:
                return "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요"
            case .needAddName:
                return "추가할 학생의 이름을 입력해주세요"
            case .needDeleteName:
                return "삭제할 학생의 이름을 입력해주세요"
            case .wrongInput:
                return "입력이 잘못되었습니다. 다시 확인해주세요"
            case .nameExist(let student):
                return "\(student.name) 학생은 이미 존재하는 학생입니다. 추가하지 않습니다."
            case .addedStudent(let student):
                return "\(student.name) 학생을 추가했습니다."
            case .noStudent(let student):
                return "\(student.name) 학생을 찾지 못했습니다."
            case .deletedStudent(let student):
                return "\(student.name) 학생을 삭제했습니다."
            case .programEnd:
                return "프로그램을 종료합니다"
            }
        }
    }
    
    var students: Set<Student>
    var inputManager: InputManagable
    
    init(inputManager: InputManagable) {
        self.inputManager = inputManager
        self.students = Set<Student>()
    }

    func run() -> Bool {
        print(Behavior.menu.output)
        guard let userInput = inputManager.toMenu() else { print(Behavior.wrongMenu.output); return true }
        inputToMenu(input: userInput)
        if userInput == Command.end.rawValue {
            return false
        }
        return true
    }
    
    func inputToMenu(input: String) {
        switch input {
        case Command.studentAdd.rawValue:
            add(student: inputManager.toStudent(message: Behavior.needAddName.output))
        case Command.studentDelete.rawValue:
            delete(student: inputManager.toStudent(message: Behavior.needDeleteName.output))
        case Command.end.rawValue:
            print(Behavior.programEnd.output)
        default:
            print(Behavior.wrongMenu.output)
        }
    }
    
    func add(student: Student?) {
        guard let student: Student = student else { print(Behavior.wrongInput.output); return }
        if students.contains(student) {
            print(Behavior.nameExist(student).output)
            return
        }
        students.insert(student)
        print(Behavior.addedStudent(student).output)
    }
    
    func delete(student: Student?) {
        guard let student: Student = student else { print(Behavior.wrongInput.output); return }
        if !students.contains(student){
            print(Behavior.noStudent(student).output)
            return
        }
        students.remove(student)
        print(Behavior.deletedStudent(student).output)
    }
    
    func find(name: String) -> Student? {
        let filtered: [Student] = students.filter({ ($0).name == name })
        if filtered.count == 0 {
            return nil
        }
        return filtered[0]
    }
}

let inputManager: InputManager = InputManager()
let menuManager: MenuManager = MenuManager(inputManager: inputManager)
while menuManager.run() {
    print()
}

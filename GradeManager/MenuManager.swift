import Foundation

protocol MenuManagable {
    var students: Dictionary<String, Student> { get set }
    func run() -> Bool
    func add(student: Student?)
    func delete(student: Student?)
}

class MenuManager: MenuManagable {
    enum Command: String, CaseIterable {
        case studentAdd = "1", studentDelete = "2",
             gradeAdd = "3", gradeDelete = "4",
             show = "5", end = "X"
        
        static var range: ClosedRange<Int> {
            let numbers = Self.allCases.compactMap({Int.init($0.rawValue)})
            return (numbers.min() ?? 0)...(numbers.max() ?? 0)
        }
        
        static func isValid(input: String) -> Bool {
            return (Self.range ~= Int(input) ?? 0) || (input == Self.end.rawValue)
        }
    }
    
    enum Behavior {
        case menu,
             needAddName, needDeleteName, needScoreName,
             needAddScore, needDeleteScore,
             addedStudent(Student), deletedStudent(Student),
             modifiedGrade(String, String, String),
             deletedGrade(String, String),
             programEnd
        
        var output: String {
            switch self {
            case .menu:
                return "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
            case .needAddName:
                return "추가할 학생의 이름을 입력해주세요"
            case .needDeleteName:
                return "삭제할 학생의 이름을 입력해주세요"
            case .needScoreName:
                return "평점을 알고싶은 학생의 이름을 입력해주세요"
            case .needAddScore:
                return """
                성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A0, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
                입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
                """
            case .needDeleteScore:
               return """
                성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
                입력예) Mickey Swift\n
                """
            case .addedStudent(let student):
                return "\(student.name) 학생을 추가했습니다."
            case .deletedStudent(let student):
                return "\(student.name) 학생을 삭제했습니다."
            case let .modifiedGrade(name, subject, grade):
                return "\(name) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다."
            case let .deletedGrade(name, subject):
                return "\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다."
            case .programEnd:
                return "프로그램을 종료합니다"
            }
        }
    }
    
    enum Error {
        case wrongMenu, wrongInput, wrongGrade,
             nameExist(Student), noStudent(Student), noSubject(String, String)
        
        var output: String {
            switch self {
            case .wrongMenu:
                return "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요"
            case .wrongInput:
                return "입력이 잘못되었습니다. 다시 확인해주세요"
            case .wrongGrade:
                return "잘못된 성적입니다. 다시 확인해주세요."
            case .nameExist(let student):
                return "\(student.name) 학생은 이미 존재하는 학생입니다. 추가하지 않습니다."
            case .noStudent(let student):
                return "\(student.name) 학생을 찾지 못했습니다."
            case let .noSubject(name, subject):
                return "\(name) 학생의 \(subject) 과목이 없습니다."
            }
        }
    }
    
    var students: Dictionary<String, Student>
    var inputManager: InputManagable
    
    init(inputManager: InputManagable) {
        self.inputManager = inputManager
        self.students = [String: Student]()
    }

    func run() -> Bool {
        print(Behavior.menu.output)
        guard let userInput = inputManager.toMenu() else { print(Error.wrongMenu.output); return true }
        inputToMenu(input: userInput)
        return userInput != Command.end.rawValue
    }
    
    func inputToMenu(input: String) {
        switch input {
        case Command.studentAdd.rawValue:
            add(student: inputManager.toStudent(message: Behavior.needAddName.output))
        case Command.studentDelete.rawValue:
            delete(student: inputManager.toStudent(message: Behavior.needDeleteName.output))
        case Command.end.rawValue:
            print(Behavior.programEnd.output)
        case Command.gradeAdd.rawValue:
            modify(score: inputManager.toScore(message: Behavior.needAddScore.output))
        case Command.gradeDelete.rawValue:
            delete(score: inputManager.toScore(message: Behavior.needDeleteScore.output))
        case Command.show.rawValue:
            show(student: inputManager.toStudent(message: Behavior.needScoreName.output))
        default:
            print(Error.wrongMenu.output)
        }
    }
    
    func add(student: Student?) {
        guard let student: Student = student else { print(Error.wrongInput.output); return }
        guard students[student.name] == nil else {
            print(Error.nameExist(student).output)
            return
        }
        students[student.name] = student
        print(Behavior.addedStudent(student).output)
        return
    }
    
    func delete(student: Student?) {
        guard let student: Student = student else { print(Error.wrongInput.output); return }
        guard students[student.name] != nil else {
            print(Error.noStudent(student).output)
            return
        }
        students[student.name] = nil
        print(Behavior.deletedStudent(student).output)
    }
    
    func delete(score: [String]?) {
        guard let score = score, score.count == 2 else { print(Error.wrongInput.output); return }
        guard let target = students[score[0]] else { print(Error.noStudent(Student(name: score[0])).output); return; }
        if target.delete(subject: score[1]) {
            students[score[0]] = target
            print(Behavior.deletedGrade(score[0], score[1]).output)
            return
        }
        print(Error.noSubject(score[0], score[1]).output)
        
    }
    
    func modify(score information: [String]?) {
        guard let information = information, information.count == 3 else { print(Error.wrongInput.output); return }
        guard let target = students[information[0]] else { print(Error.noStudent(Student(name: information[0])).output); return; }
        if target.add(subject: information[1], grade: information[2]) {
            students[information[0]] = target
            print(Behavior.modifiedGrade(information[0], information[1], information[2]).output)
            return
        }
        print(Error.wrongGrade.output)
        
    }
    
    func show(student: Student?) {
        guard let student: Student = student else { print(Error.wrongInput.output); return }
        guard let target = students[student.name] else { print(Error.noStudent(student).output); return; }
        target.printGrade()

    }
}

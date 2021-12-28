//
//  Progress.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

class ProgressController {
    func run() {
        var currentState: ProgressState = .mainMenu
        var studentInformation = StudentDictionary()
        
        mainLoop: while true {
            print(currentState.description)
            
            switch currentState {
            case .mainMenu:
                currentState = ProgressState.makeFromCommand(command: readValildLine())
                continue mainLoop
            case .addStudent:
                studentInformation.addStudent(name: readValildLine())
            case .deleteStudent:
                studentInformation.removeStudent(forName: readValildLine())
            case .addOrChangeGrade:
                break
            case .deleteGrade:
                break
            case .checkGrades:
                break
            case .terminateProgram:
                break mainLoop
            }
            
            currentState = .mainMenu
        }
    }
    
}

enum ProgressState: String {
    case mainMenu = """
    원하는 기능을 입력해주세요
    1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 병점보기, X: 종료
    """
    case addStudent = "추가할 학생의 이름을 입력해주세요"
    case deleteStudent = "삭제할 학생의 이름을 입력해주세요"
    case addOrChangeGrade
    case deleteGrade
    case checkGrades
    case terminateProgram = "프로그램을 종료합니다..."
    
    static func makeFromCommand(command: String?) -> ProgressState {
        switch command {
        case "1":
            return addStudent
        case "2":
            return deleteStudent
        case "3":
            return addOrChangeGrade
        case "4":
            return deleteGrade
        case "5":
            return checkGrades
        case "X":
            return terminateProgram
        default:
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요")
            return mainMenu
        }
    }
    
    var description: String {
        get {
            self.rawValue
        }
    }
}

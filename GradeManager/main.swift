//
//  GradeManager - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

ProgressController().run()



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

struct StudentDictionary {
    private var nameForGrades = [String: [String: Int]]()
    
    mutating func addStudent(name input: String?) {
        guard let name = input, name.isEmpty == false else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        guard nameForGrades[name] == nil else {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            return
        }
        nameForGrades[name] = [String: Int]()
        print("\(name) 학생을 추가했습니다.")
    }
    
    mutating func removeStudent(forName input: String?) {
        guard let name = input, name.isEmpty == false else {
            print("입력이 잘못되었습니다. 다시 확인해주세요")
            return
        }
        guard let _ = nameForGrades.removeValue(forKey: name) else {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        print("\(name) 학생을 삭제하였습니다.")
    }
}


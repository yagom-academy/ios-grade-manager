//
//  ScoreManager.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

enum FirstMenuList: String {
    case addStudent = "1: 학생추가"
    case deleteStudent = "2: 학생삭제"
    case addScore = "3: 성적추가(변경)"
    case deleteScore = "4: 성적삭제"
    case showAverage = "5: 평점보기"
    case exit = "X: 종료"
    
    static func allMenuList() -> String {
        return FirstMenuList.addStudent.rawValue + ", " +
                  FirstMenuList.deleteStudent.rawValue + ", " +
                  FirstMenuList.addScore.rawValue + ", " +
                  FirstMenuList.deleteScore.rawValue + ", " +
                  FirstMenuList.showAverage.rawValue + ", " +
                  FirstMenuList.exit.rawValue
    }
}

enum InputError: Error, LocalizedError {
    case firstInputError
    case inputError
    case addStudentError
    case deleteStudentError
    
    var errorDescription: String {
        switch self {
        case .firstInputError:
            return "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
        case .inputError:
            return "입력이 잘못되었습니다. 다시 확인해주세요."
        case .addStudentError:
            return "은 이미 존재하는 학생입니다. 추가하지 않습니다."
        case .deleteStudentError:
            return " 학생을 찾지 못했습니다."
        }
    }
}

struct ScoreManager {
    // MARK: - Properties
    var isExit = false
    private var storage: ScoreStorage = ScoreStorage()
    
    // MARK: - Method
    
    mutating func run() {
        while !isExit {
            showMenuList()
            let userInput = readLine()
            guard let input = userInput else {
                print(InputError.firstInputError.errorDescription)
                return
            }
            checkUserInput(input, with: self.storage)
        }
    }
    
    private func showMenuList() {
        print(FirstMenuList.allMenuList())
    }
    
    private mutating func checkUserInput(_ input: String, with storage: ScoreStorage) {
        guard var menu = FirstMenuFactory.makeFirstMenu(by: input, with: storage) else {
            print(InputError.firstInputError.errorDescription)
            return
        }
        menu.action()
        if menu.isExit {
            isExit = true
        }
    }
}


//
//  GradeManager - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum FirstMenu: String {
    case addStudent = "1: 학생추가"
    case deleteStudent = "2: 학생삭제"
    case addScore = "3: 성적추가(변경)"
    case deleteScore = "4: 성적삭제"
    case showAverage = "5: 평점보기"
    case exit = "X: 종료"
}

enum InputError: Error, LocalizedError {
    case firstInputError
    case inputError
    
    var errorDescription: String? {
        switch self {
        case .firstInputError:
            return "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
        case .inputError:
            return "입력이 잘못되었습니다. 다시 확인해주세요."
        }
    }
}

struct ScoreManager {
    var isExit = false
    
    func showMenuList() {
        print(FirstMenu.addStudent.rawValue + ", " +
        FirstMenu.deleteStudent.rawValue + ", " +
        FirstMenu.addScore.rawValue + ", " +
        FirstMenu.deleteScore.rawValue + ", " +
        FirstMenu.showAverage.rawValue + ", " +
        FirstMenu.exit.rawValue)
    }
    
    @discardableResult mutating func read(_ testInput: String? = nil) -> Bool {
        let input: String? = (testInput == nil ? readLine() : testInput)
        
        guard let menu = input else {
            print(InputError.firstInputError.localizedDescription)
            return false
        }

        return checkFirstMenu(by: menu)
    }
    
    mutating private func checkFirstMenu(by input: String) -> Bool {
        switch input {
        case "1":
            print()
            return true
        case "2":
            return true
        case "3":
            print()
            return true
        case "4":
            print()
            return true
        case "5":
            print()
            return true
        case "X":
            isExit = true
            print("프로그램을 종료합니다...")
            return true
        default:
            print(InputError.firstInputError.localizedDescription)
            return false
        }
    }
}


var manager: ScoreManager = ScoreManager()
while manager.isExit == false {
    manager.showMenuList()
    manager.read()
}

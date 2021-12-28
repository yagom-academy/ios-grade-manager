//
//  ScoreManager.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
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
    case addStudentError
    case deleteStudentError
    
    var errorDescription: String? {
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
    private var storage: Storage = Storage()
    
    // MARK: - Method
    
    mutating func run() {
        while isExit == false {
            showMenuList()
            read()
        }
    }
    
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
        
        return checkFirstMenu(by: menu, withTestInput: testInput)
    }
    
    mutating private func checkFirstMenu(by input: String,
                                         withTestInput testInput: String? = nil) -> Bool {
        switch input {
        case "1":
            addStudent(withTestInput: testInput)
            return true
        case "2":
            deleteStudent(withTestInput: testInput)
            return true
        case "3":
            return true
        case "4":
            return true
        case "5":
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
    
    mutating private func addStudent(withTestInput testInput: String? = nil) {
        guard testInput == nil else { return }
        print("추가할 학생의 이름을 입력해주세요")
        guard let input = readLine(),
              input.filter({ $0 != " " }).isEmpty == false else {
            print(InputError.inputError.localizedDescription)
            return
        }
        let result = storage.addStudent(input)
        if result {
            print(input + " 학생을 추가했습니다.")
            return
        }
        
        print(input + InputError.addStudentError.localizedDescription)
    }
    
    mutating private func deleteStudent(withTestInput testInput: String? = nil) {
        guard testInput == nil else { return }
        print("삭제할 학생의 이름을 입력해주세요")
        guard let input = readLine(),
              input.filter({ $0 != " " }).isEmpty == false else {
            print(InputError.inputError.localizedDescription)
            return
        }
        let result = storage.deleteStudent(input)
        if result {
            print(input + " 학생을 삭제했습니다.")
            return
        }
        
        print(input + InputError.deleteStudentError.localizedDescription)
    }
    
    mutating private func studentList() -> [String] {
        return storage.list()
    }
}


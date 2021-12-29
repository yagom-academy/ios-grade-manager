//
//  FirstMenu.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation

protocol FirstMenu {
    var isExit: Bool { get set }
    
    init(storage: ScoreStorage)
    
    mutating func firstAction()
}

enum FirstMenuFactory {
    static func makeFirstMenu(by input: String,
                              with storage: ScoreStorage) -> FirstMenu? {
        switch input {
        case "1":
            return AddStudentMenu(storage: storage)
        case "2":
            return DeleteStudentMenu(storage: storage)
        case "3":
            return AddStudentMenu(storage: storage)
        case "4":
            return AddStudentMenu(storage: storage)
        case "5":
            return AddStudentMenu(storage: storage)
        case "X":
            return ExitMenu(storage: storage)
        default:
            return nil
        }
    }
    
}

struct AddStudentMenu: FirstMenu {
    
    var storage: ScoreStorage
    var isExit: Bool = false
    
    init(storage: ScoreStorage) {
        self.storage = storage
    }
    
    mutating func firstAction() {
        addStudent()
    }
    
    mutating func addStudent() {
        var errorMessage: String
        print("추가할 학생의 이름을 입력해주세요")
        guard let input = readLine(),
              input.filter({ $0 != " " }).isEmpty == false else {
            errorMessage = InputError.inputError.errorDescription
            print(errorMessage)
            return
        }
        let result = storage.addStudent(input)
        if result {
            print(input + " 학생을 추가했습니다.")
            return
        }
        errorMessage = input + InputError.addStudentError.errorDescription
        print(errorMessage)
    }
}

struct DeleteStudentMenu: FirstMenu {
    var storage: ScoreStorage
    var isExit: Bool = false
    
    init(storage: ScoreStorage) {
        self.storage = storage
    }
    
    mutating func firstAction() {
        deleteStudent()
    }
    
    mutating func deleteStudent() {
        var errorMessage: String
        print("삭제할 학생의 이름을 입력해주세요")
        guard let input = readLine(),
              input.filter({ $0 != " " }).isEmpty == false else {
            errorMessage = InputError.inputError.errorDescription
            print(errorMessage)
            return
        }
        let result = storage.deleteStudent(input)
        if result {
            print(input + " 학생을 삭제했습니다.")
            return
        }
        
        errorMessage = input + InputError.deleteStudentError.errorDescription
        print(errorMessage)
    }
}

struct ExitMenu: FirstMenu {
    var storage: ScoreStorage
    var isExit: Bool = false
    
    init(storage: ScoreStorage) {
        self.storage = storage
    }
    
    mutating func firstAction() {
        exit()
    }
    
    mutating func exit() {
        print("프로그램을 종료합니다...")
        self.isExit = true
    }
}



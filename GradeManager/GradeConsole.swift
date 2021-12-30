//
//  GradeConsole.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation

struct GradeConsole {
    
    func getNameInput() throws -> String {
        guard let input = readLine(), validate(input) else {
            throw InputError.invalidNameInput
        }
        return input
    }
    
    func getMenuInput() throws -> Menu {
        guard let input = readLine(), validate(input), let menu = Menu(rawValue: input) else {
            throw InputError.invalidMenuInput
        }
        return menu
    }
        
    func showMenu() {
        print("원하는 기능을 입력해주세요")
        let menu = Menu.allCases
            .sorted {$0.rawValue < $1.rawValue}
            .map{"\($0.rawValue): \($0.description)"}
            .joined(separator: ", ")
        print(menu)
    }
    
    func showSelected(_ menu: Menu) {
        switch menu {
        case .addStudent:
            print("추가할 학생의 이름을 입력해주세요")
        case .deleteStudent:
            print("삭제할 학생의 이름을 입력해주세요")
        case .addGrade:
            break
        case .deleteGrade:
            break
        case .averageGrade:
            break
        case .exit:
            print("프로그램을 종료합니다...")
        }
    }
    
    func showAddStudentResult(_ success: Bool, name: String) {
        print(success ? "\(name) 힉셍을 추가했습니다." : "\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    }
    
    func showDeleteStudentResult(_ success: Bool, name: String) {
        print(success ? "\(name) 학생을 삭제하였습니다." : "\(name) 학생을 찾지 못했습니다.")
    }
    
    func validate(_ input: String) -> Bool {
        let input = input.replacingOccurrences(of: " ", with: "")
        let isNumberic = (Double(input) != nil)
        let isAlphabet = input.range(of: "[^a-zA-Z0-9+-]", options: .regularExpression ) == nil
        return (isNumberic || isAlphabet) && !input.isEmpty
    }
    
    func printInputError(_ error: Error){
        guard let inputError = error as? InputError else { return }
        print(inputError.errorDescription)
    }
}

enum InputError: Error, LocalizedError {
    case invalidMenuInput
    case invalidNameInput
    
    var errorDescription: String {
        switch self {
        case .invalidMenuInput:
            return "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요"
        case .invalidNameInput:
            return "입력이 잘못되었습니다. 다시 확인해주세요."
        }
    }
}

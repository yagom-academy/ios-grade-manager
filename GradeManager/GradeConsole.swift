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
            throw InputError.invalidInput
        }
        return input
    }
    
    func getMenuInput() throws -> Menu {
        guard let input = readLine(), validate(input), let menu = Menu(rawValue: input) else {
            throw InputError.invalidMenuInput
        }
        return menu
    }
    
    func getAddGradeInput() throws -> (String, String, Grade) {
        guard let input = readLine(), validateStudentGradeInputForAddition(input) else {
            throw InputError.invalidInput
        }
        let seperatedInput = input.components(separatedBy: " ")
        let name = seperatedInput[0]
        let subject = seperatedInput[1]
        guard let grade = Grade(rawValue: seperatedInput[2]) else {
            throw InputError.invalidInput
        }
        return (name, subject, grade)
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
        print(menu.menuText)
    }
    
    func showAddStudentResult(_ success: Bool, name: String) {
        success ? print(ResultMessage.addStudentSuccess(name).message) :
        print(ResultMessage.addStudentFail(name).message)
    }
    
    func showDeleteStudentResult(_ success: Bool, name: String) {
        success ? print(ResultMessage.deleteStudentSuccess(name).message) :
        print(ResultMessage.deleteStudentFail(name).message)
    }
    
    func showAddGradeResult(_ success:Bool, name: String, subject: String, grade: Grade) {
        success ? print(ResultMessage.addGradeSuccess(name, subject, grade).message) :
        print(ResultMessage.addGradeFail.message)
    }
    
    func validate(_ input: String) -> Bool {
        let input = input.replacingOccurrences(of: " ", with: "")
        let isNumberic = (Double(input) != nil)
        let isAlphabet = input.range(of: "[^a-zA-Z0-9+-]", options: .regularExpression ) == nil
        return (isNumberic || isAlphabet) && !input.isEmpty
    }
    
    func validateStudentGradeInputForAddition(_ input: String) -> Bool{
        guard validate(input) else { return false }
        let inputs = input.components(separatedBy: " ")
        guard inputs.count == 3 else { return false }
        let grade = inputs[2]
        guard validateGrade(grade) else {return false}
        
        return true
    }
    
    func validateGrade(_ input: String) -> Bool {
        return Grade(rawValue: input) != nil
    }
    
    func printInputError(_ error: Error){
        guard let inputError = error as? InputError else { return }
        print(inputError.errorDescription)
    }
}

enum InputError: Error, LocalizedError {
    case invalidMenuInput
    case invalidInput
    
    var errorDescription: String {
        switch self {
        case .invalidMenuInput:
            return "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요"
        case .invalidInput:
            return "입력이 잘못되었습니다. 다시 확인해주세요."
        }
    }
}


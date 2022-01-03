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
    
    func getAddGradeInput() throws -> (name: String, subject: String, grade: Grade) {
        guard let input = readLine() else {
            throw InputError.invalidInput
        }
        guard let inputs = validateGradeInput(input, isAddition: true) else {
            throw InputError.invalidInput
        }
        let name = inputs[0]
        let subject = inputs[1]
        guard let grade = Grade(rawValue: inputs[2]) else {
            throw InputError.invalidInput
        }
        return (name, subject, grade)
    }
    
    func getDeleteGradeInput() throws -> (name: String, subject: String) {
        guard let input = readLine(),
                let inputs = validateGradeInput(input, isAddition: false) else {
            throw InputError.invalidInput
        }
        let name = inputs[0]
        let subject = inputs[1]
        
        return (name,subject)
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
        print(ResultMessage.studentNotFound(name).message)
    }
    
    func showAddGradeResult(_ success:Bool, name: String, subject: String, grade: Grade) {
        success ? print(ResultMessage.addGradeSuccess(name, subject, grade).message) :
        print(ResultMessage.addGradeFail.message)
    }
    
    func showDeleteGradeResult(_ success:Bool, name: String, subject: String) {
        success ? print(ResultMessage.deleteGradeSuccess(name, subject)) :
        print(ResultMessage.deleteGradeFail.message)
    }
    
    func showGrade(_ grade: Grade, subject: String) {
        print("\(subject): \(grade.rawValue)")
    }
    
    func showAverageGrade(_ average: Double) {
        print("평점: \(average)")
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
    
    func validateStudentGradeInputForDeletion(_ input: String) -> Bool{
        guard validate(input) else { return false }
        let inputs = input.components(separatedBy: " ")
        guard inputs.count == 2 else { return false }
        
        return true
    }
    
    func validateGradeInput(_ input: String, isAddition: Bool) -> [String]? {
        let splitNum = isAddition ? 3 : 2
        guard let inputs = split(input: input, into: splitNum) else {
            return nil
        }
        guard validateName(inputs[0]), validateGrade(inputs[1]) else {
            return nil
        }
        
        if isAddition {
            guard validateGrade(inputs[2]) else { return nil }
        }
        return inputs
    }
    
    func split(input: String, into num: Int) -> [String]? {
        let inputs = input.components(separatedBy: " ")
        guard inputs.count == num else { return nil }
        return inputs
    }
    
    func validateName(_ input: String) -> Bool {
        input.range(of: "^[a-zA-Z]", options: .regularExpression) == nil && !input.isEmpty
    }
    
    func validateSubject(_ input: String) -> Bool {
        input.range(of: "^[a-zA-Z0-9]", options: .regularExpression) == nil && !input.isEmpty
    }
    
    func validateGrade(_ input: String) -> Bool {
        Grade(rawValue: input) != nil
    }
    
    func printInputError(_ error: Error){
        print(error.localizedDescription)
    }
}

enum InputError: Error, LocalizedError {
    case invalidMenuInput
    case invalidInput
    case invalidName(String)
    case invalidSubject(String, String)
    case noGrades
    
    var errorDescription: String? {
        switch self {
        case .invalidMenuInput:
            return "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요"
        case .invalidInput:
            return "입력이 잘못되었습니다. 다시 확인해주세요."
        case .invalidName(let name):
            return "\(name) 학생을 찾지 못했습니다."
        case .invalidSubject(let name, let subject):
            return "\(name) 학생의 \(subject) 과목 성적이 존재하지 않습니다."
        case .noGrades:
            return "과목의 성적이 하나도 존재하지 않습니다."
        }
    }
}


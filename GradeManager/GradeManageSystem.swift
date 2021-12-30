//
//  GradeManager.swift
//  GradeManager
//
//  Created by Jinwook Huh on 2021/12/27.
//

import Foundation

class GradeManageSystem {
    
    var isDone = false
    
    let menuInputPrompt = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
    let invalidMenuInputPrompt = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
    let closeProgramPrompt = "프로그램을 종료합니다..."
    let addStudentPrompt = "추가할 학생의 이름을 입력해주세요"
    let removeStudentPrompt = "삭제할 학생의 이름을 입력해주세요"
    let invalidInputPrompt = "입력이 잘못되었습니다. 다시 확인해주세요."
    let addGradePrompt = "성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A0, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다."
    let removeGradePromt = "성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요."
    
    enum MenuType: String {
        case addStudent = "1"
        case removeStudent = "2"
        case addOrModifyGrade = "3"
        case removeGrade = "4"
        case lookupGrade = "5"
        case stopProgram = "X"
    }

    var studentDictionary: [String:Student] = [:]
    
    func receiveMenuInput() throws -> String {
        print(menuInputPrompt)
        
        let receivedInput = readLine()
        guard let receivedInput = receivedInput else {
            throw InputError.invalidMenuInput
        }
        
        return receivedInput
    }
    
    
    func performMenuAction(menuInput: String) {
        switch MenuType(rawValue: menuInput) {
        case .addStudent:
            do {
                let inputName = try receiveNameInput(for: InputType.addNameInput)
                addStudent(inputName)
            } catch {
                print(invalidInputPrompt)
            }
        case .removeStudent:
            do {
                let inputName = try receiveNameInput(for: InputType.removeNameInput)
                removeStudent(inputName)
            } catch {
                print(invalidInputPrompt)
            }
        case .addOrModifyGrade:
            do {
                let inputGrade = try receiveGradeInput()
                addOrModifyGrade(withInput: inputGrade)
            } catch {
                print(invalidInputPrompt)
            }
        case .removeGrade:
            do {
                let inputGrade = try removeGradeInput()
                removeGrade(withInput: inputGrade)
            } catch {
                print(invalidInputPrompt)
            }
        case .lookupGrade:
            lookupGrade()
        case .stopProgram:
            stopProgram()
            
        case .none:
            print(invalidMenuInputPrompt)
        }
    }
    
    func receiveNameInput(for inputType: InputType) throws -> String {
        switch inputType {
        case .addNameInput:
            print(addStudentPrompt)
        case .removeNameInput:
            print(removeStudentPrompt)
        }
        let receivedInput = readLine()
        
        let regexExpression = "^[a-zA-Z0-9]*$"
        let regexTest = NSPredicate(format:"SELF MATCHES %@", regexExpression)
        
        guard let receivedInput = receivedInput, receivedInput != "", regexTest.evaluate(with: receivedInput) else {
            throw InputError.invalidInput
        }
        
        return receivedInput
    }
    
    func receiveGradeInput() throws -> String {
        print(addGradePrompt)
        
        let receivedInput = readLine()
        
        let regexExpression = "[a-zA-Z0-9]+\\s[a-zA-Z0-9]+\\s([A, B, C, D]+[0, +]|[F])"
        let regexTest = NSPredicate(format:"SELF MATCHES %@", regexExpression)
        
        guard let receivedInput = receivedInput, receivedInput != "", regexTest.evaluate(with: receivedInput) else {
            throw InputError.invalidInput
        }
        
        return receivedInput
    }
    
    func removeGradeInput() throws -> String {
        print(removeGradePromt)
        
        let receivedInput = readLine()
        
        let regexExpression = "[a-zA-Z0-9]+\\s[a-zA-Z0-9]*$"
        let regexTest = NSPredicate(format:"SELF MATCHES %@", regexExpression)
        
        guard let receivedInput = receivedInput, receivedInput != "", regexTest.evaluate(with: receivedInput) else {
            throw InputError.invalidInput
        }
        
        return receivedInput
    }
    
    func addStudent(_ studentName: String) {
        
        guard studentDictionary[studentName] == nil else {
            print("\(studentName)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            return
        }
        
        let newStudentEntity = Student(name: studentName)
        studentDictionary[studentName] = newStudentEntity
        print("\(studentName) 학생을 추가했습니다.")

    }
    
    func removeStudent(_ studentName: String) {
        
        guard studentDictionary[studentName] != nil else {
            print("\(studentName) 학생을 찾지 못했습니다.")
            return
        }
        
        studentDictionary.removeValue(forKey: studentName)
        print("\(studentName) 학생을 삭제하였습니다.")
    }
    
    func addOrModifyGrade(withInput inputGrade: String) {
        
        
        let gradeComponents = inputGrade.split(separator: " ")
        let studentName = String(gradeComponents[0])
        let subject = String(gradeComponents[1])
        let grade = String(gradeComponents[2])
        
        guard var student = studentDictionary[studentName] else {
            print("\(studentName) 학생을 찾지 못했습니다.")
            return
        }
        
        
        student.updateGrade(for: subject, as: grade)
        studentDictionary[studentName] = student
        
        print("\(studentName) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
        

    }
    
    func removeGrade(withInput inputGrade: String) {
        let gradeComponents = inputGrade.split(separator: " ")
        let studentName = String(gradeComponents[0])
        let subject = String(gradeComponents[1])
        
        guard var student = studentDictionary[studentName] else {
            print("\(studentName) 학생을 찾지 못했습니다.")
            return
        }
        
        student.removeGrade(for: subject)
        studentDictionary[studentName] = student
        
        print("\(studentName) 학생의 \(subject) 과목 성적이 삭제되었습니다.")
        

    }
    
    func lookupGrade() {
        print(#function)

    }
    
    func stopProgram() {
        isDone = true
        print(closeProgramPrompt)
    }

}

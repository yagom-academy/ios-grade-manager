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
    
    var studentDictionary: [String:Student] = [:]
    
    
    func receiveMenuInput() {
        print(menuInputPrompt)
        
        let receivedInput = readLine()
        
        switch receivedInput {
        case "1":
            addStudent()
        case "2":
            removeStudent()
        case "3":
            addOrModifyGrade()
        case "4":
            removeGrade()
        case "5":
            lookupGrade()
        case "X":
            stopProgram()
            
        default:
            print(invalidMenuInputPrompt)
        }
    }
    
    func addStudent() {
        print(addStudentPrompt)
        let receivedInput = readLine()
        
        guard let studentName = receivedInput, studentName != "" else {
            print(invalidInputPrompt)
            return
        }
        
        guard studentDictionary[studentName] == nil else {
            print("\(studentName)은/는 이미 존재하는 학생입니다. 추가하지 않습니다.")
            return
        }
        
        let newStudentEntity = Student(name: studentName)
        studentDictionary[studentName] = newStudentEntity
        print("\(studentName) 학생을 추가했습니다.")

    }
    
    func removeStudent() {
        print(removeStudentPrompt)
        let receivedInput = readLine()
        
        guard let studentName = receivedInput, studentName != "" else {
            print(invalidInputPrompt)
            return
        }
        
        guard studentDictionary[studentName] != nil else {
            print("\(studentName) 학생을 찾지 못했습니다.")
            return
        }
        
        studentDictionary.removeValue(forKey: studentName)
        print("\(studentName) 학생을 삭제하였습니다.")
    }
    
    func addOrModifyGrade() {
        print(#function)

    }
    
    func removeGrade() {
        print(#function)

    }
    
    func lookupGrade() {
        print(#function)

    }
    
    func stopProgram() {
        isDone = true
        print(closeProgramPrompt)
    }
    
    
    
}

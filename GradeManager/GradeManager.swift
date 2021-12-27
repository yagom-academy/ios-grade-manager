//
//  GradeManager.swift
//  GradeManager
//
//  Created by Jinwook Huh on 2021/12/27.
//

import Foundation

class GradeManager {
    
    private var isDone = false
    
    let menuInputPrompt = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
    let invalidMenuInputPrompt = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
    let closeProgramPrompt = "프로그램을 종료합니다..."
    let addStudentPrompt = "추가할 학생의 이름을 입력해주세요"
    let invalidInputPrompt = "입력이 잘못되었습니다. 다시 확인해주세요."
    
    
    func run() {
        while !gradeManager.isDone {
            gradeManager.receiveMenuInput()
        }
    }
    
    
    private func receiveMenuInput() {
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
    
    private func addStudent() {
        print(addStudentPrompt)
        let receivedInput = readLine()
        
        guard let receivedInput = receivedInput else {
            print(invalidInputPrompt)
            return
        }

    }
    
    private func removeStudent() {
        print(#function)

    }
    
    private func addOrModifyGrade() {
        print(#function)

    }
    
    private  func removeGrade() {
        print(#function)

    }
    
    private func lookupGrade() {
        print(#function)

    }
    
    private func stopProgram() {
        isDone = true
        print(closeProgramPrompt)
    }
    
    
    
}

//
//  GradeManager.swift
//  GradeManager
//
//  Created by Jinwook Huh on 2021/12/27.
//

import Foundation

class GradeManager {
    
    private var isDone = false
    
    let menuInputPromptText = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
    let invalidInputAlertPromptText = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
    let closeProgramPromptText = "프로그램을 종료합니다..."
    
    
    func run() {
        while !gradeManager.isDone {
            gradeManager.receiveMenuInput()
        }
    }
    
    private func printMenuInputPrompt() {
        print(menuInputPromptText)
    }
    
    private func receiveMenuInput() {
        printMenuInputPrompt()
        
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
            print(invalidInputAlertPromptText)
        }
    }
    
    private func addStudent() {
        print(#function)
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
        print(closeProgramPromptText)
    }
    
    
    
}

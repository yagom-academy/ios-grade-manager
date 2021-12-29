//
//  GradeConsole.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation

struct GradeConsole {
    let gradeManager = GradeManager()
        
    func showMenu() -> Bool {
        printMenu()
        guard let input = readLine(), validate(input) else {
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요")
            return true
        }
        switch MenuAction(rawValue: input.lowercased()){
        case .addingStudent:
            showAddStudentMenu()
        case .deletingStudent:
            showDeleteStudentMenu()
        case .addingGrade:
            break
        case .deletingGrade:
            break
        case .averageGrade:
            break
        case .exit:
            print("프로그램을 종료합니다...")
            return false
        case .none:
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요")
        }
        return true
    }
    
    private func showAddStudentMenu() {
        print("추가할 학생의 이름을 입력해주세요")
        guard let name = readLine(), validate(name) else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        switch gradeManager.addStudent(by: name) {
        case true:
            print("\(name) 힉셍을 추가했습니다.")
        case false:
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        }
    }
    
    private func showDeleteStudentMenu() {
        print("삭제할 학생의 이름을 입력해주세요")
        guard let name = readLine(),validate(name) else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        switch gradeManager.deleteStudent(by: name) {
        case true:
            print("\(name) 학생을 삭제하였습니다.")
        case false:
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
    
    private func printMenu() {
        print("원하는 기능을 입력해주세요")
        let menu = MenuAction.allCases.map{"\($0.rawValue): \($0.description)"}
            .joined(separator: ", ")
        print(menu)
    }
    
    private func validate(_ input: String) -> Bool{
        let input = input.replacingOccurrences(of: " ", with: "")
        return (!input.isEmpty && Double(input) != nil) || input.range(of: "[^a-zA-Z0-9]", options: .regularExpression ) == nil
    }
    
    enum MenuAction: String, CaseIterable {
        case addingStudent = "1"
        case deletingStudent = "2"
        case addingGrade = "3"
        case deletingGrade = "4"
        case averageGrade = "5"
        case exit = "x"
        
        var description: String {
            switch self {
            case .addingStudent:
                return "학생추가"
            case .deletingStudent:
                return "학생삭제"
            case .addingGrade:
                return "성적추가(변경)"
            case .deletingGrade:
                return "성적삭제"
            case .averageGrade:
                return "평점보기"
            case .exit:
                return "종료"
            }
        }
    }
}

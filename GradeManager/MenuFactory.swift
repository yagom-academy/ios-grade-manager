//
//  MenuFactory.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation

class MenuFactory {
    private init() { }
    
    static let instruction = """
    원하는 기능을 입력해주세요
    1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 병점보기, X: 종료
    """
    
    static func makeFromInput() throws -> Menu {
        print(instruction)
        let command = readLine()
        switch command {
        case "1":
            return AddStudentMenu()
        case "2":
            return DeleteStudentMenu()
        case "X":
            return TerminateMenu()
        default:
            throw InputError.wrongCommand
        }
    }
}

//
//  Menu.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation

enum Menu: String, CaseIterable {
    case addStudent = "1"
    case deleteStudent = "2"
    case addGrade = "3"
    case deleteGrade = "4"
    case averageGrade = "5"
    case exit = "x"
    
    var description: String {
        switch self {
        case .addStudent:
            return "학생추가"
        case .deleteStudent:
            return "학생삭제"
        case .addGrade:
            return "성적추가(변경)"
        case .deleteGrade:
            return "성적삭제"
        case .averageGrade:
            return "평점보기"
        case .exit:
            return "종료"
        }
    }
}

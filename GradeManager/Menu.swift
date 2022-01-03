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
    
    var menuText: String {
        switch self {
        case .addStudent:
            return "추가할 학생의 이름을 입력해주세요"
        case .deleteStudent:
            return "삭제할 학생의 이름을 입력해주세요"
        case .addGrade:
            return """
성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A0, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
입력예) Mickey Swift A+
만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
"""
        case .deleteGrade:
            return """
성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
입력예) Mickey Swift
"""
        case .averageGrade:
            return "평점을 알고싶은 학생의 이름을 입력해주세요"
        case .exit:
            return "프로그램을 종료합니다..."
        }
    }
}

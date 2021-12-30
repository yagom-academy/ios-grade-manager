//
//  GradeManagingMenu.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation

enum GradeManagingMenu: Int, CaseIterable {
    case addStudent = 1
    case deleteStudent
    case addOrUpdateGrade
    case deleteGrade
    case showGradePointAverage
    
    var menuName: String {
        switch self {
        case .addStudent: return "\(self.rawValue): 학생추가"
        case .deleteStudent: return "\(self.rawValue): 학생삭제"
        case .addOrUpdateGrade: return "\(self.rawValue): 성적추가(변경)"
        case .deleteGrade: return "\(self.rawValue): 성적삭제"
        case .showGradePointAverage: return "\(self.rawValue): 평점보기"
        }
    }
}

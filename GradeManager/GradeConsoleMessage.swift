//
//  GradeConsoleMessage.swift
//  GradeManager
//
//  Created by kakao on 2021/12/30.
//

import Foundation

typealias Name = String
typealias Subject = String

enum ResultMessage {
    case addStudentFail(Name)
    case addStudentSuccess(Name)
    case deleteStudentFail(Name)
    case deleteStudentSuccess(Name)
    case addGradeSuccess(Name, Subject, Grade)
    case addGradeFail
    
    var message: String{
        switch self {
        case .addStudentFail(let name):
            return "\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다."
        case .addStudentSuccess(let name):
            return "\(name) 힉셍을 추가했습니다."
        case .deleteStudentFail(let name):
            return "\(name) 학생을 찾지 못했습니다."
        case .deleteStudentSuccess(let name):
            return "\(name) 학생을 삭제하였습니다."
        case .addGradeSuccess(let name, let subject, let grade):
            return "\(name) 학생의 \(subject) 과목이 \(grade.rawValue) 로 추가(변경)되었습니다."
        case .addGradeFail:
            return "성적 추가(변경)이 실패하였습니다."
        }
    }
    
}



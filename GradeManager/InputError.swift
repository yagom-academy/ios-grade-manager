//
//  InputError.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

import Foundation

enum InputError: Error {
    case wrongCommand, wrongName
}

extension InputError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .wrongCommand:
            return "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요"
        case .wrongName:
            return "입력이 잘못되었습니다. 다시 확인해주세요."
        }
    }
}

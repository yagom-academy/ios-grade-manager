//
//  MenuInputValidationResult.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

enum MenuInputValidationResult : Equatable{
    case valid(of: Int)
    case invalid
    case exit
}

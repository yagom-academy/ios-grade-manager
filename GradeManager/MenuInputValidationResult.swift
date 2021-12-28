//
//  MenuInputValidationResult.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

enum MenuInputValidationResult : Equatable{
    case validMenuNumber(of: Int)
    case invalidMenuNumber
    case exit
}

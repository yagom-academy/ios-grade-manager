//
//  util.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

let validInputPattern = "^[\\s\\da-zA-Z]+$"

func readValildLine() -> String? {
    let input = readLine()
    guard let _ = input?.range(of: validInputPattern, options: .regularExpression) else{
        return nil
    }
    return input
}

//
//  util.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

let validInputPattern = "^[\\s\\da-zA-Z]+$"

extension String {
    func isValidInput() -> Bool {
        if let _ = self.range(of: validInputPattern, options: .regularExpression) {
            return true
        }
        return false
    }
}

func readValidLine() -> String? {
    let input = readLine()
    guard let validInput = input, validInput.isValidInput() else{
        return nil
    }
    return input
}

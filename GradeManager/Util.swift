//
//  util.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

let validNamePattern = "^[\\da-zA-Z]+$"

extension String {
    func isValidName() -> Bool {
        if let _ = self.range(of: validNamePattern, options: .regularExpression) {
            return true
        }
        else {
            return false
        }
    }
}

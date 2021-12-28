//
//  GradeManager.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

struct GradeManager{
    
    func validateMenuNumber(of input: String?) -> MenuInputValidationResult{
                
        guard let input = input, !input.isEmpty else {
            return .invalid
        }
        
        if input.lowercased() == "x" {
            return .exit
        }
        
        guard let menuNum = Int(input), 1...5 ~= menuNum else {
            return .invalid
        }
        
        return .valid(of: menuNum)
        
    }
}

//
//  Extension+String.swift
//  GradeManager
//
//  Created by kakao on 2021/12/29.
//

extension String {
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    var consistsOfEnglishAndNumbers: Bool {
        let pattern = "^[A-Za-z0-9]*$"
        
        guard let _ = self.range(of: pattern, options: .regularExpression) else {
            return false
        }

        return true
    }
    
    func uppercasingFirstAndLowercasingRest() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
}

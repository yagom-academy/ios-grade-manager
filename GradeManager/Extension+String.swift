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
    
    func uppercasingFirstAndLowercasingRest() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
}

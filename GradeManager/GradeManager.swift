//
//  GradeManager.swift
//  GradeManager
//
//  Created by Jinwook Huh on 2021/12/28.
//

import Foundation

class GradeManager {
    
    private let gradeManageSystem = GradeManageSystem()
    
    func run() {
        while !gradeManageSystem.isDone {
            gradeManageSystem.receiveMenuInputFromCmd()
        }
    }
}

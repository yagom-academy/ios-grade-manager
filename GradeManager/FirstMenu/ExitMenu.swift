//
//  ExitMenu.swift
//  GradeManager
//
//  Created by kakao on 2021/12/30.
//

import Foundation

struct ExitMenu: FirstMenu {
    private var storage: ScoreStorage
    var isExit: Bool = false
    
    init(storage: ScoreStorage) {
        self.storage = storage
    }
    
    mutating func action() {
        exit()
    }
    
    private mutating func exit() {
        print("프로그램을 종료합니다...")
        self.isExit = true
    }
}


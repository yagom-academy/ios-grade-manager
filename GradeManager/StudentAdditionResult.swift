//
//  StudentAdditionResult.swift
//  GradeManager
//
//  Created by kakao on 2021/12/28.
//

import Foundation

enum StudentAdditionResult: Equatable{
    case invalidName
    case redundantName(of: String)
    case success(of: String)
}

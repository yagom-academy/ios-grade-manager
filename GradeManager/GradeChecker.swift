//
//  GradeChecker.swift
//  GradeManager
//
//  Created by kakao on 2021/12/30.
//

struct GradeChecker {
    private let scoreDic: Dictionary<String, Double> = ["A+": 4.5, "A0": 4.0, "B+": 3.5, "B0": 3.0, "C+": 2.5, "C0": 2.0, "D+": 1.5, "D0": 1.0, "F": 0.0]
    
    func isSuitableGrade(_ grade: String) -> Bool {
        if scoreDic.keys.contains(grade) {
            return true
        }
        return false
    }
    
    func calculateAverage(_ grades: Dictionary<String,String>) {
        var score: Double = 0.0
        for (subj, grade) in grades {
            print("\(subj): \(grade)")
            guard let s = scoreDic[grade] else {
                return
            }
            score += s
        }
        score /= Double(grades.count)
        print("평점 : \(score)")
    }
}

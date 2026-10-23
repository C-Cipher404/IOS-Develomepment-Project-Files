//
//  Models.swift
//  Course3StudyGuide
//
//  Created by Cortney Anderson on 10/22/26.
//

import Foundation

struct QuestionAnswer: Identifiable {
    let id = UUID()
    let question: String
    let answer: String
}

struct Topic: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let summary: String
    let questions: [QuestionAnswer]
    let example: String
}

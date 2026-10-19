//
//  MultiplicationQuestion.swift
//  Multiplication Tables
//
//  Created by Cortney Anderson on 10/19/26.
//

import Foundation

struct MultiplicationQuestion {
    let firstNumber: Int
    let secondNumber: Int

    var answer: Int {
        firstNumber * secondNumber
    }
}

//
//  ContentView.swift
//  ScratchPaper
//
//  Created by Cortney Anderson on 9/24/26.
//

import SwiftUI

enum LibrarySection {
    case fiction, nonFiction, reference, periodicals
}


enum AgeGroup: Int{
    case child = 0, teen = 13
    case adult = 18, senior = 65
    case awaitingUserInput = "Awating user"
}
let grown = AgeGroup(rawValue: 18)
let thrity = AgeGroup(rawValue: 30)

enum LoadingStatus {
    case idle, loading, success, failure
    
    
    var isFinished: Bool{
        switch self{
        case .success, .failure:
            return true
        case .idle, .loading, .awaitingUserInput:
            return false
            
            var description: String {
            case .loading:
            case .idle:
            case .
            }
        }
    }
    
    var loadingStatus: LoadingStatus = .idle
}

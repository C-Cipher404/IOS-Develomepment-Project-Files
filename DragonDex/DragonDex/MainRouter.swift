//
//  MainRouter.swift
//  DragonDex
//
//  Created by Cortney Anderson on 11/11/26.
//


import SwiftUI
import Observation

@Observable
class MainRouter {

    enum Tab: Hashable {
        case dragons
        case riders
    }

    var selectedTab: Tab = .dragons

    var isShowingSettings = false
}

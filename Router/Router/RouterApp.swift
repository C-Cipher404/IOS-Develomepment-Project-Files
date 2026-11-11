//
//  RouterApp.swift
//  Router
//
//  Created by Cortney Anderson on 11/11/26.
//

import SwiftUI

@Observable
Class HomeRouter {
    var navigationPath = NavigationPath()
    
    enum Route: Hashable {
        case details(item: Item)
        case settings
    }
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
            
        case .details(let item):
            DetailView(item: item)
            
        case .settings:
            SettingView()
        }
    }
    
    func navigateTo(route: Route){
        navigationPath.append(route)
    }
}

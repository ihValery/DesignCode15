//
//  TabBarModel.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 4.05.22.
//

import SwiftUI

//MARK: - TabBarModel

enum TabBarModel: String {
    
    case home
    case explore
    case notification
    case library
    
    //MARK: Properties

    var text: String {
        switch self {
        case .home: return GlobalConstant.TabBar.textHome
        case .explore: return GlobalConstant.TabBar.textExplore
        case .notification: return GlobalConstant.TabBar.textNotification
        case .library: return GlobalConstant.TabBar.textLibrary
        }
    }
    
    var icon: String {
        switch self {
        case .home: return GlobalConstant.TabBar.iconHome
        case .explore: return GlobalConstant.TabBar.iconExplore
        case .notification: return GlobalConstant.TabBar.iconNotification
        case .library: return GlobalConstant.TabBar.iconLibrary
        }
    }
    
    var color: Color {
        switch self {
        case .home: return .teal
        case .explore: return .blue
        case .notification: return .red
        case .library: return .pink
        }
    }
}

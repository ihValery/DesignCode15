//
//  TabBarVM.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 4.05.22.
//

import SwiftUI

//MARK: - TabBarVM

final class TabBarVM: ObservableObject {

    //MARK: Properties
    
    @Published var models: [TabBarModel] = [.home, .explore, .notification, .library]
    
    var countTab: CGFloat {
        CGFloat(models.count)
    }
}

//
//  GlobalConstant.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 2.05.22.
//

import SwiftUI

//MARK: - GlobalConstant

struct GlobalConstant {
    
    struct Corner {
        ///30
        static let card: CGFloat = 30
        ///20
        static let logo: CGFloat = 20
    }
    
    struct Padding {
        static let step8: CGFloat = 8
        ///20
        static let stepDefault: CGFloat = 20
    }
    
    struct Text {
        static let homeCardTitle = "SwiftUI for iOS 15"
        static let homeCardSubtitle = "20 sections - 3 hours"
        static let homeCardDescription = "Build an iOS app for iOS 15 with custom layouts, animations and ..."
    }
    
    struct Size {
        static let homeCard: CGSize = .init(width: 0, height: 350)
        static let homeCardLogo: CGSize = .init(width: 26, height: 26)
    }
    
    struct Logos {
        static let logo1 = "Logo 1"
        static let logo2 = "Logo 2"
        static let logo3 = "Logo 3"
        static let logo4 = "Logo 4"
    }
}

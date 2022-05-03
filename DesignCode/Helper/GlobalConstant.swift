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
        ///10
        static let logo: CGFloat = 10
        ///16
        static let logoBackground: CGFloat = 16
    }
    
    struct Padding {
        static let step8: CGFloat = 8
        static let step9: CGFloat = 9
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
        static let homeCardImage: CGSize = .init(width: 0, height: 230)
        static let homeCardLogo: CGSize = .init(width: 26, height: 26)
    }
    
    struct Logos {
        static let logo1 = "Logo 1"
        static let logo2 = "Logo 2"
        static let logo3 = "Logo 3"
        static let logo4 = "Logo 4"
    }
    
    struct Images {
        static let blobOne: Image = Image("Blob 1")
        static let illustration1: Image = Image("Illustration 1")
        static let illustration2: Image = Image("Illustration 2")
        static let illustration3: Image = Image("Illustration 3")
        static let illustration4: Image = Image("Illustration 4")
        static let illustration5: Image = Image("Illustration 5")
        static let illustration6: Image = Image("Illustration 6")
        static let illustration7: Image = Image("Illustration 7")
        static let illustration8: Image = Image("Illustration 8")
        static let illustration9: Image = Image("Illustration 9")
        static let illustration10: Image = Image("Illustration 10")
    }
    
    struct Account {
        static let navigationTitle = "Account"
        static let name = "ihValery"
        static let location = "Minsk"
        static let sectionSettings: Label = .init("Settings", systemImage: "gear")
        static let sectionBilling: Label = .init("Billing", systemImage: "creditcard")
        static let sectionHelp: Label = .init("Help", systemImage: "questionmark")
        static let sectionWebsite: Label = .init("Website", systemImage: "house")
        static let sectionYoutube: Label = .init("YouTube", systemImage: "tv")
        static let systemImagePerson = Image(systemName: "person.crop.circle.fill.badge.checkmark")
        static let systemImageLocation = Image(systemName: "location")
        static let systemImageHexagon = Image(systemName: "hexagon.fill")
        static let systemImageLink = Image(systemName: "link")
        static let linkWebsite: URL = .init(string: "https://www.apple.com")!
        static let linkYoutube: URL = .init(string: "https://www.youtube.com")!
    }
}

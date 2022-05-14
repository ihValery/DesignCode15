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
        ///14
        static let buttonMagnifyingglass: CGFloat = 14
        ///16
        static let buttonAvatar: CGFloat = 16
        ///34
        static let tabBar: CGFloat = 34
        static let tabBarDash: CGFloat = 3
    }
    
    struct Padding {
        static let step6: CGFloat = 6
        static let step8: CGFloat = 8
        static let step9: CGFloat = 9
        static let step14: CGFloat = 14
        ///20
        static let stepDefault: CGFloat = 20
    }
        
    struct Size {
        static let homeCard: CGSize = .init(width: 0, height: 350)
        static let homeCardImage: CGSize = .init(width: 0, height: 230)
        static let homeCardLogo: CGSize = .init(width: 26, height: 26)
        static let tabBar: CGSize = .init(width: 0, height: 88)
        static let homeCardIsFullScreen: CGSize = .init(width: 0, height: 500)
        static let tabBarIcon: CGSize = .init(width: 44, height: 29)
        static let tabBarCircle: CGSize = .init(width: 88, height: 88)
        static let tabBarDash: CGSize = .init(width: 28, height: 5)
        static let navigationBar: CGSize = .init(width: 0, height: 70)
        static let buttonMagnifyingglass: CGSize = .init(width: 36, height: 36)
        static let buttonAvatar: CGSize = .init(width: 26, height: 26)
    }
    
    struct TabBar {
        static let textHome = "Learn Now"
        static let textExplore = "Explore"
        static let textNotification = "Notification"
        static let textLibrary = "Library"
        static let iconHome = "house"
        static let iconExplore = "magnifyingglass"
        static let iconNotification = "bell"
        static let iconLibrary = "rectangle.stack"
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
        
        static let background1: Image = Image("Background 1")
        static let background2: Image = Image("Background 2")
        static let background3: Image = Image("Background 3")
        static let background4: Image = Image("Background 4")
        static let background5: Image = Image("Background 5")
        static let background6: Image = Image("Background 6")
        static let background7: Image = Image("Background 7")
        static let background8: Image = Image("Background 8")
        static let background9: Image = Image("Background 9")
        static let background10: Image = Image("Background 10")
    }
    
    struct Avatar {
        static let avatarOne = "Avatar 1"
        static let avatarTwo = "Avatar 2"
        static let avatarThree = "Avatar 3"
        static let avatarDefault = "Avatar Default"
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
    
    struct NavigationBar {
        static let title = "Featured"
        static let magnifyingglass = "magnifyingglass"
    }
}

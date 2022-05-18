//
//  CourseVM.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 13.05.22.
//

import SwiftUI

//MARK: - TabBarVM

final class CourseVM: ObservableObject {

    //MARK: Properties
    
    @Published var featuredItems: [CourseModel] = []
    
    @Published var courses: [CourseModel] = []

    //MARK: Initializer
    
    init() {
        getFeaturedItemsData()
        
        getCoursesData()
    }
    
    //MARK: Private Methods

    private func getFeaturedItemsData() {
        featuredItems = [
            CourseModel("SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "Build an iOS app for iOS 15 with custom layouts, animations and ...", image: GlobalConstant.Images.illustration5, background: GlobalConstant.Images.background5, logo: GlobalConstant.Logos.logo2),
            CourseModel("UI Design for iOS 15", subtitle: "20 sections - 3 hours", text: "Design an iOS app for iOS 15 with custom layouts, animations and ...", image: GlobalConstant.Images.illustration3, background: GlobalConstant.Images.background3, logo: GlobalConstant.Logos.logo4),
            CourseModel("Flutter for designers", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: GlobalConstant.Images.illustration1, background: GlobalConstant.Images.background1, logo: GlobalConstant.Logos.logo1),
            CourseModel("React Hooks Advanced", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: GlobalConstant.Images.illustration2, background: GlobalConstant.Images.background2, logo: GlobalConstant.Logos.logo3),
        ]
    }
    
    private func getCoursesData() {
        courses = [
            CourseModel("SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "Build an iOS app for iOS 15 with custom layouts, animations and ...", image: GlobalConstant.Images.illustration6, background: GlobalConstant.Images.background6, logo: GlobalConstant.Logos.logo2),
            CourseModel("UI Design for iOS 15", subtitle: "20 sections - 3 hours", text: "Design an iOS app for iOS 15 with custom layouts, animations and ...", image: GlobalConstant.Images.illustration7, background: GlobalConstant.Images.background7, logo: GlobalConstant.Logos.logo4),
            CourseModel("Flutter for designers", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: GlobalConstant.Images.illustration8, background: GlobalConstant.Images.background8, logo: GlobalConstant.Logos.logo1),
            CourseModel("React Hooks Advanced", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: GlobalConstant.Images.illustration4, background: GlobalConstant.Images.background4, logo: GlobalConstant.Logos.logo3),
        ]
    }
}

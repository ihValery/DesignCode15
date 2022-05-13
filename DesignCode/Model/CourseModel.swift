//
//  CourseModel.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 13.05.22.
//

import SwiftUI

struct CourseModel: Identifiable {

    //MARK: Properties

    let id: UUID
    var title: String
    var subtitle: String
    var text: String
    var image: Image
    var logo: String
    
    //MARK: Initializer

    init(_ title: String, subtitle: String, text: String, image: Image, logo: String) {
        id = UUID()
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.image = image
        self.logo = logo
    }
}

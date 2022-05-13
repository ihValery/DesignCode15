//
//  DefaultText.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 2.05.22.
//

import SwiftUI

//MARK: - DefaultText

struct DefaultText: View {
    
    //MARK: Properties
    
    private let text: String
    
    private let font: Font
    
    private let weight: Font.Weight
    
    private let lineLimit: Int
    
    var body: some View {
        Text(text)
            .font(font)
            .fontWeight(weight)
            .lineLimit(lineLimit)
    }
    
    //MARK: Initializer
    
    init(_ text: String, font: Font, weight: Font.Weight, lineLimit: Int = 1) {
        self.text = text
        self.font = font
        self.weight = weight
        self.lineLimit = lineLimit
    }
}

//MARK: - PreviewProvider

struct DefaultTextView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultText("SwiftUI iOS 15",
                        font: .largeTitle, weight: .bold)
    }
}

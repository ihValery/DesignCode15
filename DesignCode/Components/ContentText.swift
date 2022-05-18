//
//  ContentText.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 18.05.22.
//

import SwiftUI

//MARK: - ContentText

struct ContentText: View {
    
    //MARK: Properties
    
    private let textPlug: [String] = Array(repeating: "It's just a text, and I didn't type it thirty times. Lazy text.", count: 30)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            DefaultText("Just text", font: .title, weight: .bold)
            
            DefaultText(textPlug.joined(separator: " "), font: .body, weight: .regular, lineLimit: 100)
        }
    }
}

//MARK: - PreviewProvider

struct ContentText_Previews: PreviewProvider {
    static var previews: some View {
        ContentText()
    }
}

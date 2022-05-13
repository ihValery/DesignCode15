//
//  AnimatableFontModifier.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 13.05.22.
//

import SwiftUI

//MARK: - AnimatableFontModifier

struct AnimatableFontModifier: AnimatableModifier {
    
    //MARK: Properties
    
    var size: Double
    
    var animatableData: Double {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size))
    }
}

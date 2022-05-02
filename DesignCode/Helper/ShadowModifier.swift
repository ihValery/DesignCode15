//
//  ShadowModifier.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 3.05.22.
//

import SwiftUI

//MARK: - ShadowModifier

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .shadowDefault.opacity(0.3), radius: 10, x: 0, y: 10)
    }
}

//MARK: - Extension

extension View {
    func defaultShadow() -> some View {
        self.modifier(ShadowModifier())
    }
}

//
//  StylesModifier.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 3.05.22.
//

import SwiftUI

//MARK: - ShadowModifier

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.shadow(color: .shadowDefault.opacity(0.3), radius: 10, x: 0, y: 10)
    }
}

//MARK: - StrokeModifier

struct StrokeModifier: ViewModifier {

    //MARK: Properties
    
    @Environment(\.colorScheme) var colorScheme
    
    private let cornerRadius: CGFloat
    
    private var gradient: LinearGradient {
        .init(colors: [.white.opacity(colorScheme == .dark ? 0.6 : 0.3),
                       .black.opacity(colorScheme == .dark ? 0.3 : 0.1)],
              startPoint: .top, endPoint: .bottom)
    }

    //MARK: Body

    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(gradient)
                .blendMode(.overlay)
        )
    }
    
    //MARK: Initializer
    
    init(_ cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
    }
}

//MARK: - Extension

extension View {
    func defaultShadow() -> some View {
        modifier(ShadowModifier())
    }
    
    func defaultStroke(_ cornerRadius: CGFloat = GlobalConstant.Corner.card) -> some View {
        modifier(StrokeModifier(cornerRadius))
    }
}

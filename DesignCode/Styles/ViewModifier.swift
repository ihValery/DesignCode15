//
//  ViewModifier.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 3.05.22.
//

import SwiftUI

//MARK: - ShadowModifier

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.shadow(color: .shadowDefault.opacity(0.15), radius: 10, x: 0, y: 10)
    }
}

//MARK: - StrokeModifier

struct StrokeModifier: ViewModifier {
    
    //MARK: Enum
    
    enum ShapeType {
        case circle
        case rectangle
    }
    
    //MARK: Properties
    
    @Environment(\.colorScheme) var colorScheme
    
    private let shape: ShapeType
    
    private let cornerRadius: CGFloat
    
    private var gradient: LinearGradient {
        .init(colors: [.white.opacity(colorScheme == .dark ? 0.6 : 0.3),
                       .black.opacity(colorScheme == .dark ? 0.3 : 0.1)],
              startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    @ViewBuilder private var shapeForOverlay: some View {
        switch shape {
        case .circle:
            Circle()
                .stroke(gradient)
                .blendMode(.overlay)
        case .rectangle:
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(gradient)
                .blendMode(.overlay)
        }
    }
    
    func body(content: Content) -> some View {
        content.overlay(
            shapeForOverlay
        )
    }
    
    //MARK: Initializer
    
    init(_ shape: ShapeType,_ cornerRadius: CGFloat) {
        self.shape = shape
        self.cornerRadius = cornerRadius
    }
}

//
//  FeaturedCourse.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 13.05.22.
//

import SwiftUI

//MARK: - FeaturedCourse

struct FeaturedCourse: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let gradientForText = LinearGradient.init(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
        static let offsetOverlay: CGSize = .init(width: 32, height: -80)
    }
    
    //MARK: Properties
    
    private let course: CourseModel
    
    private let geometryMinX: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: GlobalConstant.Padding.step8) {
            Spacer()
            
            LogoButton(course.logo)
            
            DefaultText(course.title, font: .largeTitle, weight: .bold)
                .foregroundStyle(InternalConstant.gradientForText)
            
            DefaultText(course.subtitle.uppercased(), font: .footnote, weight: .semibold)
                .foregroundStyle(.secondary)
            
            DefaultText(course.text, font: .footnote, weight: .semibold, lineLimit: 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(GlobalConstant.Padding.stepDefault)
        .padding(.vertical, GlobalConstant.Padding.stepDefault)
        .frame(height: GlobalConstant.Size.homeCard.height)
        .frame(maxWidth: 500)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: GlobalConstant.Corner.card, style: .continuous))
        .defaultStroke(.rectangle)
        .padding(.horizontal, GlobalConstant.Padding.stepDefault)
        .rotation3DEffect(.degrees(geometryMinX / -10), axis: (x: 0, y: 1, z: 0))
        .defaultShadow()
        .blur(radius: abs(geometryMinX / 40))
        .overlay(createImage)
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    var createImage: some View {
        course.image
            .resizable()
            .scaledToFit()
            .frame(height: GlobalConstant.Size.homeCardImage.height)
            .offset(InternalConstant.offsetOverlay)
            .offset(x: geometryMinX / 2)
    }
    
    //MARK: Initializer
    
    init(_ course: CourseModel, geometryMinX: CGFloat) {
        self.course = course
        self.geometryMinX = geometryMinX
    }
}

//MARK: - PreviewProvider

struct FeaturedItem_Previews: PreviewProvider {
    static let item0 = CourseVM().courses[1]
    static let item2 = CourseVM().courses[2]
    
    static var previews: some View {
        Group {
            FeaturedCourse(item0, geometryMinX: 0)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            FeaturedCourse(item2, geometryMinX: 0)
                .previewLayout(.sizeThatFits)
        }
        .previewDevice("iPhone 13 Pro")
        .padding(.vertical, 20)
    }
}

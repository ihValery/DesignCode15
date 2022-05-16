//
//  CourseItem.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 16.05.22.
//

import SwiftUI

//MARK: - CourseItem

struct CourseItem: View {
    
    //MARK: Properties
    
    var namespace: Namespace.ID
    
//    @State private var isFullScreen = false
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 12) {
                DefaultText("SwiftUI iOS 15", font: .largeTitle, weight: .bold)
                    .matchedGeometryEffect(id: "title", in: namespace)
                
                DefaultText("20 sections - 3 hours", font: .footnote, weight: .semibold)
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                
                DefaultText("Build an iOS app for iOS 15 with custom layouts, animations and ...", font: .footnote, weight: .semibold, lineLimit: 3)
                    .matchedGeometryEffect(id: "text", in: namespace)
            }
            .padding(GlobalConstant.Padding.stepDefault)
            .frame(maxWidth: .infinity)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: GlobalConstant.Corner.card,
                                           style: .continuous))
                    .blur(radius: 30)
                    .offset(y: 25)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            GlobalConstant.Images.illustration9
                .resizable()
                .scaledToFit()
                .matchedGeometryEffect(id: "image", in: namespace)
        )
        .background(
            GlobalConstant.Images.background5
                .resizable()
                .scaledToFill()
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: GlobalConstant.Corner.card,
                             style: .continuous)
            .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .frame(height: GlobalConstant.Size.homeCard.height)
        .padding(GlobalConstant.Padding.stepDefault)
    }
}

//MARK: - PreviewProvider

struct CoursesItem_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseItem(namespace: namespace)
    }
}

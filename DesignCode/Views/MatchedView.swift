//
//  MatchedView.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 14.05.22.
//

import SwiftUI

//MARK: - MatchedView

struct MatchedView: View {
    
    //MARK: Properties

    @Namespace private var namespace
    
    @State private var isFullScreen: Bool = false

    var body: some View {
        ZStack {
            if isFullScreen {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: GlobalConstant.Size.homeCardIsFullScreen.height)
                    .foregroundColor(.black)
                    .padding(GlobalConstant.Padding.stepDefault)
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
                    .overlay(
                        VStack(alignment: .leading, spacing: 12) {
                            
                            DefaultText("Build an iOS app for iOS 15 with custom layouts, animations and ...", font: .footnote, weight: .semibold, lineLimit: 3)
                                .matchedGeometryEffect(id: "text", in: namespace)
                            DefaultText("SwiftUI iOS 15", font: .largeTitle, weight: .bold)
                                .matchedGeometryEffect(id: "title", in: namespace)
                            
                            DefaultText("20 sections - 3 hours", font: .footnote, weight: .semibold)
                                .matchedGeometryEffect(id: "subtitle", in: namespace)
                            
                            Divider()
                            HStack {
                                LogoButton(GlobalConstant.Avatar.avatarThree)
                                
                                DefaultText("Create ihValery", font: .footnote, weight: .regular)
                            }
                        }
                            .padding(GlobalConstant.Padding.stepDefault)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(RoundedRectangle(cornerRadius: GlobalConstant.Corner.card,
                                                           style: .continuous))
                                    .matchedGeometryEffect(id: "blur", in: namespace)
                            )
                            .offset(y: 250)
                            .padding(GlobalConstant.Padding.stepDefault)
                    )
                }
                .ignoresSafeArea()

            } else {
                ///small Card
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
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isFullScreen.toggle()                
            }
        }
    }
}

//MARK: - PreviewProvider

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}

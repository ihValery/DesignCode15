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
                VStack(alignment: .leading, spacing: 12) {
                    Spacer()
                    
                    DefaultText("Build an iOS app for iOS 15 with custom layouts, animations and ...", font: .footnote, weight: .semibold, lineLimit: 3)
                        .matchedGeometryEffect(id: "text", in: namespace)
                    
                    DefaultText("20 sections - 3 hours", font: .footnote, weight: .semibold)
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    
                    DefaultText("SwiftUI iOS 15", font: .largeTitle, weight: .bold)
                        .matchedGeometryEffect(id: "title", in: namespace)
                }
                .foregroundColor(.black)
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    Color.pink
                        .matchedGeometryEffect(id: "background", in: namespace)
                        .ignoresSafeArea()
                )
                .padding(20)
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    DefaultText("SwiftUI iOS 15", font: .largeTitle, weight: .bold)
                        .matchedGeometryEffect(id: "title", in: namespace)
                    
                    DefaultText("20 sections - 3 hours", font: .footnote, weight: .semibold)
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    
                    DefaultText("Build an iOS app for iOS 15 with custom layouts, animations and ...", font: .footnote, weight: .semibold, lineLimit: 3)
                        .matchedGeometryEffect(id: "text", in: namespace)
                }
                .foregroundColor(.white)
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    Color.purple
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
                .padding(20)
            }
        }
        .onTapGesture {
            withAnimation(.linear) {
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

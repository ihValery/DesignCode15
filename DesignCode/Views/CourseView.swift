//
//  CourseView.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 17.05.22.
//

import SwiftUI

//MARK: - CourseView

struct CourseView: View {
    
    //MARK: Properties
    
    private var namespace: Namespace.ID
    
    @Binding var isFullScreen: Bool
    
    @State private var appear: [Bool] = [false, false]
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: true) {
                cover
                
                content
            }
            .background(Color.backgroundDefault)
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: GlobalConstant.Size.tabBar.height)
            }
            .ignoresSafeArea()
            
            closeButton
        }
        
        .onAppear {
            withAnimation(.easeOut.delay(0.2)) { appear[0] = true }
            withAnimation(.easeOut.delay(0.3)) { appear[1] = true }
        }
        .onChange(of: isFullScreen) { newValue in
            appear[0] = false
            appear[1] = false
        }
    }
    
    private var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: GlobalConstant.Size.homeCardIsFullScreen.height)
        .foregroundColor(.black)
        .padding(GlobalConstant.Padding.stepDefault)
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
                DefaultText("SwiftUI iOS 15", font: .largeTitle, weight: .bold)
                    .matchedGeometryEffect(id: "title", in: namespace)
                
                DefaultText("20 sections - 3 hours", font: .footnote, weight: .semibold)
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                
                DefaultText("Build an iOS app for iOS 15 with custom layouts, animations and ...", font: .footnote, weight: .semibold, lineLimit: 3)
                    .matchedGeometryEffect(id: "text", in: namespace)
                
                Divider()
                    .opacity(appear[0] ? 1: 0)
                HStack {
                    LogoButton(GlobalConstant.Avatar.avatarThree)
                    
                    DefaultText("Create ihValery", font: .footnote, weight: .regular)
                }
                .opacity(appear[1] ? 1: 0)
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
    
    private var closeButton: some View {
        CloseButton() {
            withAnimation(.closeCard) { isFullScreen.toggle() }
        }
        .padding(.horizontal, GlobalConstant.Padding.stepDefault)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 10) {
            DefaultText("This course", font: .title, weight: .bold)
    
            DefaultText("SwiftUI is hands-down the best way for designers to take a first step into code. ", font: .body, weight: .regular, lineLimit: 100)
            
            
            DefaultText("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.SwiftUI makes it super easy to animate and add gestures to your app. The code is lightweight and easy to understand, even for newcomers who come from React or Flutter.", font: .body, weight: .regular, lineLimit: 100)
            
            DefaultText("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.SwiftUI makes it super easy to animate and add gestures to your app. The code is lightweight and easy to understand, even for newcomers who come from React or Flutter.", font: .body, weight: .regular, lineLimit: 100)
        }
        .offset(y: 100)
        .padding(.bottom, 100)
        .padding(.horizontal, GlobalConstant.Padding.stepDefault)
        .opacity(appear[1] ? 1 : 0)
    }
    
    //MARK: Initializer
    
    init(_ namespace: Namespace.ID,_ isFullScreen: Binding<Bool>) {
        self.namespace = namespace
        self._isFullScreen = isFullScreen
    }
}

//MARK: - PreviewProvider

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseView(namespace, .constant(false))
    }
}

//
//  CourseCardDetail.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 17.05.22.
//

import SwiftUI

//MARK: - CourseCardDetail

struct CourseCardDetail: View {
    
    //MARK: Properties
    
    @EnvironmentObject private var controlPanel: ControlPanelApp
    
    @State private var animationSplit: [Bool] = [false, false]
    
    @State private var gesture: CGSize = .zero
    
    @State private var isDragable: Bool = true
    
    private let course: CourseModel
    
    private var namespace: Namespace.ID
    
    @Binding var isFullScreen: Bool
    
    var body: some View {
        ZStack {
            Color.green
                .frame(width: 100, height: 200)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .zIndex(1)
            
            ScrollView(.vertical, showsIndicators: true) {
                cover
                
                content
            }
            .background(Color.backgroundDefault)
            .mask(RoundedRectangle(cornerRadius: gesture.width / 3, style: .continuous))
            .scaleEffect(1 + gesture.width / -500)
            .shadow(color: .black.opacity(0.4), radius: 30, x: 0, y: 10)
            .background(.black.opacity(Double(gesture.width / 300)))
            .background(.ultraThinMaterial)
            .gesture(isDragable ? dragGestures : nil)
            .ignoresSafeArea()
            
            closeButton
                .opacity(gesture.width > 0 ? 0 : 1)
        }
        
        .onAppear {
            appearAnimation()
        }
        .onChange(of: isFullScreen) { _ in
            disappearAnimation()
        }
    }
    
    private var cover: some View {
        GeometryReader { grProxy in
            let minY = grProxy.frame(in: .global).minY
            let isDown = minY > 0
            
            imageLogoCourse
                .offset(y: isDown ? 0 : minY / -1.7)
                .frame(maxWidth: .infinity)
                .frame(height: GlobalConstant.Size.homeCardIsFullScreen.height + (isDown ? minY : 0))
                .background(
                    imageBackground
                        .blur(radius: minY / 10)
                        .scaleEffect(isDown ? 1 + minY / 500 : 1)
                        .offset(y: isDown ? 0 : minY / -1.3)
                )
                .mask(cardForm)
                .overlay(
                    headerCard
                        .offset(y: isDown ? minY / 2 : 0)
                )
                .offset(y: isDown ? -minY : 0)
        }
        .frame(height: GlobalConstant.Size.homeCardIsFullScreen.height)
    }
    
    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            DefaultText(course.title, font: .largeTitle, weight: .bold, lineLimit: 2)
                .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
            
            DefaultText(course.subtitle, font: .footnote, weight: .semibold)
                .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
            
            DefaultText(course.text, font: .footnote, weight: .semibold, lineLimit: 2)
                .matchedGeometryEffect(id: "text\(course.id)", in: namespace)
            
            Divider()
                .opacity(animationSplit[0] ? 1: 0)
            
            HStack {
                LogoButton(GlobalConstant.Avatar.avatarThree)
                
                DefaultText("Create ihValery", font: .body, weight: .regular)
            }
            .opacity(animationSplit[1] ? 1: 0)
        }
        .padding(GlobalConstant.Padding.stepDefault)
        .background(backgroundHeader)
        .padding(.horizontal, GlobalConstant.Padding.stepDefault)
        .offset(y: 250)
    }
    
    private var backgroundHeader: some View {
        Rectangle()
            .fill(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: GlobalConstant.Corner.card, style: .continuous))
            .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
    }
    
    private var imageLogoCourse: some View {
        course.image
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
    }
    
    private var imageBackground: some View {
        course.background
            .resizable()
            .scaledToFill()
            .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
    }
    
    private var cardForm: some View {
        RoundedRectangle(cornerRadius: GlobalConstant.Corner.card, style: .continuous)
            .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
    }
    
    private var closeButton: some View {
        CloseButton() {
            withAnimation(.closeCard) {
                isFullScreen.toggle()
                controlPanel.isShowDetailCard.toggle()
            }
        }
        .padding(GlobalConstant.Padding.stepDefault)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .ignoresSafeArea()
    }
    
    private var content: some View {
        ContentText()
            .offset(y: 130)
            .padding(.bottom, 160)
            .padding(.horizontal, GlobalConstant.Padding.stepDefault)
            .opacity(animationSplit[1] ? 1 : 0)
    }
    
    private var dragGestures: some Gesture {
        DragGesture()
            .onChanged { value in
                guard value.translation.width > 0 else { return }
                
                if value.startLocation.x < 10 {
                    withAnimation(.closeCard) {
                        gesture = value.translation
                    }
                }
                
                if value.translation.width > 100 {
                    closeCard()
                }
            }
            .onEnded { value in
                if value.translation.width > 80 {
                    closeCard()
                } else {
                    withAnimation(.closeCard) {
                        gesture = .zero
                    }
                }
            }
    }
    
    //MARK: Initializer
    
    init(_ course: CourseModel,_ namespace: Namespace.ID,_ isFullScreen: Binding<Bool>) {
        self.course = course
        self.namespace = namespace
        self._isFullScreen = isFullScreen
    }
    
    //MARK: Private Methods
    
    private func appearAnimation() {
        withAnimation(.easeOut.delay(0.2)) { animationSplit[0] = true }
        withAnimation(.easeOut.delay(0.3)) { animationSplit[1] = true }
    }
    
    private func disappearAnimation() {
        animationSplit[0] = false
        animationSplit[1] = false
    }
    
    private func closeCard() {
        withAnimation(.closeCard) {
            isFullScreen.toggle()
            controlPanel.isShowDetailCard.toggle()
        }
        withAnimation(.closeCard) {
            gesture = .zero
        }
        
        isDragable = false
    }
}

//MARK: - PreviewProvider

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    static let course = CourseVM().featuredItems[0]
    
    static var previews: some View {
        CourseCardDetail(course, namespace, .constant(false))
            .environmentObject(ControlPanelApp())
    }
}

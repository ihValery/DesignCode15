//
//  HomeView.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 13.05.22.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let coordinateSpace = "scroll"
        static let offsetBackgroundFeatureItem: CGSize = .init(width: 250, height: -100)
    }
    
    //MARK: Properties
    
    @ObservedObject private var courseViewModel = CourseVM()
    
    @Namespace private var namespace
    
    @State private var hasScroll: Bool = false
    
    @State private var isFullScreen: Bool = false
    
    @State private var isShowStatusBar: Bool = true
    
    var body: some View {
        ZStack {
            Color.backgroundDefault.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: true) {
                scrollDetection
                
                featuredCourses
                
                headerCourse
                
                courseItem
            }
            .coordinateSpace(name: InternalConstant.coordinateSpace)
            
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 70)
            }
            .overlay(
                NavigationBar(GlobalConstant.NavigationBar.title, $hasScroll),
                alignment: .top
            )
            
            courseView
        }
        .statusBar(hidden: !isShowStatusBar)
        .onChange(of: isFullScreen) { newValue in
            withAnimation(.closeCard) { isShowStatusBar = !newValue }
        }
        
        
        .onAppear {
            print("Appear HomeView")
        }
        .onDisappear {
            print("Disappear HomeView")
        }
    }
    
    private var scrollDetection: some View {
        GeometryReader { geometry in
            let minY = geometry.frame(in: .named(InternalConstant.coordinateSpace)).minY
            Color.clear
                .preference(key: ScrollPreferenceKey.self, value: minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut(duration: 0.2)) {
                hasScroll = value < 0 ? true : false
            }
        })
    }
    
    private var featuredCourses: some View {
        TabView {
            ForEach(courseViewModel.featuredItems) { course in
                GeometryReader { geometry in
                    FeaturedCourse(course, geometryMinX: geometry.frame(in: .global).minX)
                        .padding(.vertical, 20)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: GlobalConstant.Size.homeCard.height + 50)
        .background(
            GlobalConstant.Images.blobOne
                .offset(InternalConstant.offsetBackgroundFeatureItem)
        )
    }
    
    private var headerCourse: some View {
        DefaultText("Courses".uppercased(), font: .footnote, weight: .semibold)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, GlobalConstant.Padding.stepDefault)
    }
    
    private var courseItem: some View {
        ForEach(courseViewModel.courses) { course in
            CourseItem(course, namespace)
                .opacity(isFullScreen ? 0 : 1)
                .onTapGesture {
                    withAnimation(.openCard) { isFullScreen.toggle() }
            }
        }
    }
    
    @ViewBuilder private var courseView: some View {
        if isFullScreen {
            ForEach(courseViewModel.courses) { course in
                CourseView(course, namespace, $isFullScreen)
                    .zIndex(1)
                    .transition(
                        .asymmetric(insertion: .opacity.animation(.linear(duration: 0.1)),
                                    removal: .opacity.animation(.easeOut.delay(0.2)))
                )
            }
        }
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}

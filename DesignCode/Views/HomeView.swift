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
    
    @EnvironmentObject private var courseViewModel: CourseVM
    
    @EnvironmentObject private var controlPanel: ControlPanelApp
    
    @Namespace private var namespace
    
    @State private var isSmallScroll = false
    
    @State private var isFullScreen = false
    
    @State private var isShowStatusBar = true
    
    @State private var selectedCourse: CourseModel? = nil
    
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
                NavigationBar(GlobalConstant.NavigationBar.title, $isSmallScroll),
                alignment: .top
            )
            
            courseView
        }
        .statusBar(hidden: !isShowStatusBar)
        .onChange(of: isFullScreen) { newValue in
            withAnimation(.closeCard) {
                isShowStatusBar = !newValue
            }
            
            if !newValue { selectedCourse = nil }
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
                isSmallScroll = value < 0 ? true : false
            }
        })
    }
    
    var featuredCourses: some View {
        TabView {
            ForEach(courseViewModel.featuredItems) { course in
                GeometryReader { geometry in
                    FeaturedCourse(course, geometryMinX: geometry.frame(in: .global).minX)
                        .padding(.top, 20)
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
        DefaultText(GlobalConstant.HomeView.courses, font: .footnote, weight: .semibold)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, GlobalConstant.Padding.stepDefault)
    }
    
    private var courseItem: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {
            ForEach(courseViewModel.courses) { course in
                if isFullScreen {
                    CourseCardSmallPlug()
                } else {
                    CourseCardSmall(course, namespace)
                        .opacity(isFullScreen ? 0 : 1)
                        .onTapGesture {
                            withAnimation(.openCard) {
                                isFullScreen.toggle()
                                controlPanel.isShowDetailCard.toggle()
                                isShowStatusBar = false
                                selectedCourse = course
                            }
                        }
                }
            }
        }
        .padding(.horizontal, GlobalConstant.Padding.stepDefault)
    }
    
    @ViewBuilder private var courseView: some View {
        if let selectedCourse = selectedCourse, isFullScreen {
            CourseCardDetail(selectedCourse, namespace, $isFullScreen)
                .zIndex(1)
 
        }
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ControlPanelApp())
            .environmentObject(CourseVM())
            .previewDevice("iPhone 13 Pro")
    }
}

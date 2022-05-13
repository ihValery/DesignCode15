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
    
    @State private var hasScroll: Bool = false
    
    var body: some View {
        ZStack {
            Color.backgroundDefault.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: true) {
                scrollDetection
                
                featuredCourses
            }
            .coordinateSpace(name: InternalConstant.coordinateSpace)
            
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(NavigationBar(GlobalConstant.NavigationBar.title, $hasScroll), alignment: .top)
        }
    }
    
    var scrollDetection: some View {
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
    
    var featuredCourses: some View {
        TabView {
            ForEach(courseViewModel.featuredItems) { course in
                GeometryReader { geometry in
                    FeaturedCourse(course, geometryMinX: geometry.frame(in: .global).minX)
                        .padding(.vertical, 40)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: GlobalConstant.Size.homeCard.height + 80)
        .background(
            GlobalConstant.Images.blobOne
                .offset(InternalConstant.offsetBackgroundFeatureItem)
        )
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

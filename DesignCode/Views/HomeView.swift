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
    }
    
    //MARK: Properties
    
    @State private var hasScroll: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            GeometryReader { geometry in
                let minY = geometry.frame(in: .named(InternalConstant.coordinateSpace)).minY
                Color.clear
                    .preference(key: ScrollPreferenceKey.self, value: minY)
            }
            .frame(height: .zero)
            
            FeaturedItem()
            
            Color.red
                .frame(height: 1000)
        }
        .coordinateSpace(name: InternalConstant.coordinateSpace)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                hasScroll = value < 0 ? true : false
            }
        })
        
        .safeAreaInset(edge: .top, content: {
            NavigationBar(GlobalConstant.NavigationBar.title)
                .opacity(hasScroll ? 1 : 0)
        })
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

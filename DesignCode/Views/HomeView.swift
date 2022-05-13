//
//  HomeView.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 13.05.22.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: Properties
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            FeaturedItem()
            
            Color.red
                .frame(height: 1000)
        }
        .safeAreaInset(edge: .top, content: {
            NavigationBar(GlobalConstant.NavigationBar.title)
        })
        .ignoresSafeArea()
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

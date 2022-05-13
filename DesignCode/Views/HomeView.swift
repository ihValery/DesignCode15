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
        ScrollView(.vertical, showsIndicators: false) {
            FeaturedItem()
        }
        .overlay(NavigationBar(GlobalConstant.NavigationBar.title), alignment: .top)
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

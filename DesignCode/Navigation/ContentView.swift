//
//  ContentView.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 2.05.22.
//

import SwiftUI

//MARK: - ContentView

struct ContentView: View {
    
    //MARK: Properties
    
    @AppStorage("selectTab") var selectTab: TabBarModel = .home
    
    var body: some View {
        ZStack {
            switch selectTab {
            case .home:
                HomeView()
            case .explore:
                AccountView()
            case .notification:
                Color.pink
                    .ignoresSafeArea()
            case .library:
                Color.purple
                    .ignoresSafeArea()
            }
        }
        .safeAreaInset(edge: .bottom) {
            TabBarView($selectTab)
        }
        .ignoresSafeArea()
    }
}

//MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

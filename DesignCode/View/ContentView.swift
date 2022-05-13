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
                Color.teal
                    .ignoresSafeArea()
            case .notification:
                Color.pink
                    .ignoresSafeArea()
            case .library:
                Color.purple
                    .ignoresSafeArea()
            }
            
            TabBarView($selectTab)
        }
    }
}

//MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

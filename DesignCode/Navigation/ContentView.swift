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
    
    @EnvironmentObject var controlPanel: ControlPanelApp
    
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
            
            TabBarView($selectTab)
                .offset(y: controlPanel.isShowDetailCard ? 200 : 0)
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear.frame(height: 55)
        }
    }
}

//MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ControlPanelApp())
            .environmentObject(CourseVM())
    }
}

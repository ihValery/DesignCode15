//
//  TabBarView.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 4.05.22.
//

import SwiftUI

//MARK: - TabBarView

struct TabBarView: View {
    
    //MARK: Properties
    
    @ObservedObject private var tabBarViewModel = TabBarVM()
    
    @State private var selectTab: TabBarModel = .home
    
    var body: some View {
        ZStack {
            switch selectTab {
            case .home:
                Color.black
                    .ignoresSafeArea()
            case .explore:
                Color.black
                    .ignoresSafeArea()
            case .notification:
                Color.black
                    .ignoresSafeArea()
            case .library:
                Color.black
                    .ignoresSafeArea()
            }
            
            tabBarPanel
        }
    }
    
    private var tabBarPanel: some View {
        HStack(spacing: .zero) {
            ForEach(tabBarViewModel.models, id: \.self) { item in
                OneTabView(item, $selectTab)
            }
        }
        .padding(.horizontal, GlobalConstant.Padding.step8)
        .padding(.top, GlobalConstant.Padding.step14)
        .frame(height: GlobalConstant.Size.tabBar.height, alignment: .top)
        .background(.ultraThinMaterial)
        .background(indicatorCircleTabBar)
        .overlay(indicatorDashTabBar)
        .clipShape(
            RoundedRectangle(cornerRadius: GlobalConstant.Corner.tabBar,
                             style: .continuous)
        )
        .defaultStroke(GlobalConstant.Corner.tabBar)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    private var indicatorCircleTabBar: some View {
        HStack {
            if selectTab == .explore { Spacer() }
            if selectTab == .notification { Spacer(); Spacer() }
            if selectTab == .library { Spacer() }
            
            Circle()
                .fill(selectTab.color)
                .frame(width: GlobalConstant.Size.tabBarCircle.width,
                       height: GlobalConstant.Size.tabBarCircle.height)
                .frame(width: getScreenSize().width / tabBarViewModel.countTab)
            
            if selectTab == .home { Spacer() }
            if selectTab == .explore { Spacer(); Spacer() }
            if selectTab == .notification { Spacer() }
        }
        .padding(.horizontal, GlobalConstant.Padding.step6)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectTab)
    }
    
    private var indicatorDashTabBar: some View {
        HStack {
            if selectTab == .explore { Spacer() }
            if selectTab == .notification { Spacer(); Spacer() }
            if selectTab == .library { Spacer() }
            
            Rectangle()
                .fill(selectTab.color)
                .frame(width: GlobalConstant.Size.tabBarDash.width,
                       height: GlobalConstant.Size.tabBarDash.height)
                .cornerRadius(GlobalConstant.Corner.tabBarDash)
                .frame(width: getScreenSize().width / tabBarViewModel.countTab)
                .frame(maxHeight: .infinity, alignment: .top)
            
            if selectTab == .home { Spacer() }
            if selectTab == .explore { Spacer(); Spacer() }
            if selectTab == .notification { Spacer() }
        }
        .padding(.horizontal, GlobalConstant.Padding.step6)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectTab)
    }
    
    //MARK: Private Methotds

//    private
}

//MARK: - PreviewProvider

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

//MARK: - OneTabView

fileprivate struct OneTabView: View {
    
    //MARK: Properties
    
    @Binding private var selectTab: TabBarModel
    
    private let tab: TabBarModel
    
    var body: some View {
        Button {
            selectTab = tab
        } label: {
            VStack(alignment: .center, spacing: .zero) {
                Image(systemName: tab.icon)
                    .symbolVariant(.fill)
                    .font(.body.bold())
                    .frame(width: GlobalConstant.Size.tabBarIcon.width,
                           height: GlobalConstant.Size.tabBarIcon.height)
                
                Text(tab.text)
                    .font(.caption2)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity)
        }
        .foregroundStyle(selectTab == tab ? .primary : .secondary)
        .blendMode(selectTab == tab ? .overlay : .normal)
    }
    
    //MARK: Initializer
    
    init(_ tab: TabBarModel,_ selectTab: Binding<TabBarModel>){
        self.tab = tab
        self._selectTab = selectTab
    }
}

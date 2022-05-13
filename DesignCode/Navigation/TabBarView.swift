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
    
    @State private var widthTab: CGFloat = .zero
    
    @Binding var selectTab: TabBarModel
    
    var body: some View {
        HStack {
            ForEach(tabBarViewModel.models, id: \.self) { item in
                OneTabView(item, $selectTab, $widthTab)
            }
        }
        .padding(.horizontal, GlobalConstant.Padding.step8)
        .frame(height: GlobalConstant.Size.tabBar.height)
        .background(.ultraThinMaterial)
        .background(AnimateMoveTab(selectTab, indicatorCircleTabBar))
        .overlay(AnimateMoveTab(selectTab, indicatorDashTabBar))
        .clipShape(
            RoundedRectangle(cornerRadius: GlobalConstant.Corner.tabBar,
                             style: .continuous)
        )
        .defaultStroke(GlobalConstant.Corner.tabBar)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    private var indicatorCircleTabBar: some View {
        Circle()
            .fill(selectTab.color)
            .frame(width: widthTab)
    }
    
    private var indicatorDashTabBar: some View {
        Rectangle()
            .fill(selectTab.color)
            .frame(width: GlobalConstant.Size.tabBarDash.width,
                   height: GlobalConstant.Size.tabBarDash.height)
            .cornerRadius(GlobalConstant.Corner.tabBarDash)
            .frame(width: widthTab)
            .frame(maxHeight: .infinity, alignment: .top)
    }
    
    //MARK: Initializer
    
    init(_ selectTab: Binding<TabBarModel>) {
        self._selectTab = selectTab
    }
}

//MARK: - PreviewProvider

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(.constant(.home))
            .previewInterfaceOrientation(.portrait)
    }
}

//MARK: - OneTabView

fileprivate struct OneTabView: View {
    
    //MARK: Properties
    
    @Binding private var selectTab: TabBarModel
    
    @Binding private var widthTab: CGFloat
    
    private let tab: TabBarModel
    
    var body: some View {
        GeometryReader { geometry in
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
                .padding(.top, GlobalConstant.Padding.step14)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .preference(key: TabPreferenceKey.self, value: geometry.size.width)
                .onPreferenceChange(TabPreferenceKey.self, perform: { value in
                    widthTab = value
                })
            }
            .foregroundStyle(selectTab == tab ? .primary : .secondary)
            .blendMode(selectTab == tab ? .overlay : .normal)
        }
    }
    
    //MARK: Initializer
    
    init(_ tab: TabBarModel,
         _ selectTab: Binding<TabBarModel>,
         _ widthTab: Binding<CGFloat>){
        
        self.tab = tab
        self._selectTab = selectTab
        self._widthTab = widthTab
    }
}

//MARK: - AnimateMoveTab

fileprivate struct AnimateMoveTab<Indicator: View>: View {
    
    //MARK: Properties
    
    private var selectTab: TabBarModel
    
    private var indicator: Indicator
    
    var body: some View {
        HStack {
            if selectTab == .explore { Spacer() }
            if selectTab == .notification { Spacer(); Spacer() }
            if selectTab == .library { Spacer() }
            
            indicator
            
            if selectTab == .home { Spacer() }
            if selectTab == .explore { Spacer(); Spacer() }
            if selectTab == .notification { Spacer() }
        }
        .padding(.horizontal, GlobalConstant.Padding.step6)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectTab)
    }
    
    //MARK: Initializer
    
    init(_ selectTab: TabBarModel,_ indicator: Indicator) {
        self.selectTab = selectTab
        self.indicator = indicator
    }
}

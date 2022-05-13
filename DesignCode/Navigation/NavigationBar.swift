//
//  NavigationBar.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 13.05.22.
//

import SwiftUI

//MARK: - NavigationBar

struct NavigationBar: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let offsetForBlur: CGFloat = 13
    }
    
    //MARK: Properties
    
    private var heightNavigationBar: CGFloat {
        GlobalConstant.Size.navigationBar.height
        + getSafeArea().top
        + InternalConstant.offsetForBlur
    }
    
    private let title: String
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            
            HStack(spacing: 16) {
                DefaultText(title, font: .largeTitle, weight: .bold)
                
                Spacer()
                
                magnifyingglass
                
                avatar
            }
            .padding(.horizontal, GlobalConstant.Padding.stepDefault)
            .padding(.bottom)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .offset(y: -InternalConstant.offsetForBlur)
        .frame(height: heightNavigationBar)
    }
    
    var magnifyingglass: some View {
        Image(systemName: GlobalConstant.NavigationBar.magnifyingglass)
            .font(.body.bold())
            .frame(width: GlobalConstant.Size.buttonMagnifyingglass.width,
                   height: GlobalConstant.Size.buttonMagnifyingglass.height)
            .foregroundColor(.secondary)
            .background(.ultraThinMaterial,
                        in: RoundedRectangle(cornerRadius: GlobalConstant.Corner.buttonMagnifyingglass,
                                             style: .continuous))
            .defaultStroke(GlobalConstant.Corner.buttonMagnifyingglass)
    }
    
    var avatar: some View {
        Image(GlobalConstant.Avatar.avatarDefault)
            .resizable()
            .frame(width: GlobalConstant.Size.buttonAvatar.width,
                   height: GlobalConstant.Size.buttonAvatar.height)
            .cornerRadius(GlobalConstant.Corner.logo)
            .padding(GlobalConstant.Padding.step8)
            .background(.ultraThinMaterial,
                        in: RoundedRectangle(cornerRadius: GlobalConstant.Corner.buttonAvatar,
                                             style: .continuous))
            .defaultStroke(GlobalConstant.Corner.buttonAvatar)
    }

    
    //MARK: Initializer
    
    init(_ title: String) {
        self.title = title
    }
}

//MARK: - PreviewProvider

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(GlobalConstant.NavigationBar.title).background(.cyan)
    }
}

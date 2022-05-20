//
//  NavigationBar.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 13.05.22.
//

import SwiftUI

//MARK: - NavigationBar

struct NavigationBar: View {
    
    //MARK: Properties
    
    @Binding var isSmallScroll: Bool
    
    private let title: String
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(isSmallScroll ? 1 : 0)
            
            HStack(spacing: 16) {
                Text(title)
                    .bold()
                    .animatableFont(isSmallScroll ? 22 : 34)
                
                Spacer()
                
                SearchButton()
                
                AvatarButton(GlobalConstant.Avatar.avatarThree)
            }
            .padding(.horizontal, GlobalConstant.Padding.stepDefault)
            .padding(.bottom, isSmallScroll ? GlobalConstant.Padding.step6 : 0)
        }
        .frame(height: isSmallScroll ? 44 : GlobalConstant.Size.navigationBar.height)
    }
    
    //MARK: Initializer
    
    init(_ title: String,_ isSmallScroll: Binding<Bool>) {
        self.title = title
        self._isSmallScroll = isSmallScroll
    }
}

//MARK: - PreviewProvider

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(GlobalConstant.NavigationBar.title, .constant(false))
            .background(.cyan.opacity(0.1))
    }
}

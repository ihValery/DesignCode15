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
    
    @Binding var hasScroll: Bool
    
    private let title: String
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScroll ? 1 : 0)
            
            HStack(spacing: 16) {
                Text(title)
                    .bold()
                    .animatableFont(hasScroll ? 22 : 34)
                
                Spacer()
                
                SearchButton()
                
                AvatarButton(GlobalConstant.Avatar.avatarThree)
            }
            .padding(.horizontal, GlobalConstant.Padding.stepDefault)
            .padding(.bottom, hasScroll ? GlobalConstant.Padding.step6 : 0)
        }
        .frame(height: hasScroll ? 44 : GlobalConstant.Size.navigationBar.height)
    }
    
    //MARK: Initializer
    
    init(_ title: String,_ hasScroll: Binding<Bool>) {
        self.title = title
        self._hasScroll = hasScroll
    }
}

//MARK: - PreviewProvider

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(GlobalConstant.NavigationBar.title, .constant(false))
            .background(.cyan.opacity(0.1))
    }
}

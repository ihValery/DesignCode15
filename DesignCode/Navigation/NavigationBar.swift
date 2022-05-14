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
//                DefaultText(title, font: .largeTitle, weight: .bold)
                Text(title)
                    .bold()
                    .animatableFont(hasScroll ? 22 : 34)
                
                Spacer()
                
                magnifyingglass
                
                AvatarButton(GlobalConstant.Avatar.avatarDefault)
            }
            .padding(.horizontal, GlobalConstant.Padding.stepDefault)
            .padding(.top, hasScroll ? 0 : GlobalConstant.Padding.stepDefault)
        }
        .frame(height: hasScroll ? 44 : GlobalConstant.Size.navigationBar.height)
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
            .background(.cyan)
    }
}

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
    
    private var title: String = ""
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            
            DefaultText(title, font: .largeTitle, weight: .bold)
                .padding(.leading, GlobalConstant.Padding.stepDefault)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: GlobalConstant.Size.navigationBar.height)
    }
    
    //MARK: Initializer
    
    init(_ title: String) {
        self.title = title
    }
}

//MARK: - PreviewProvider

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(GlobalConstant.NavigationBar.title)
    }
}

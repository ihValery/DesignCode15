//
//  MatchedView.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 14.05.22.
//

import SwiftUI

//MARK: - MatchedView

struct MatchedView: View {
    
    //MARK: Properties

    @Namespace private var namespace
    
    @State private var isFullScreen: Bool = false

    var body: some View {
        ZStack {
            if isFullScreen {

            } else {

            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isFullScreen.toggle()                
            }
        }
    }
}

//MARK: - PreviewProvider

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}

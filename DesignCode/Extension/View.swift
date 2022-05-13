//
//  View.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 4.05.22.
//

import SwiftUI

//MARK: - View

extension View {
    func getSafeArea() -> UIEdgeInsets {
        let null = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return null }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else { return null }
        
        return safeArea
    }
}

//extension View {
//    func getScreenSize() -> CGSize {
//        UIScreen.main.bounds.size
//    }
//}

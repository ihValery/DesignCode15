//
//  ViewExtension.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 4.05.22.
//

import SwiftUI

//MARK: - ViewExtension

extension View {
    func getScreenSize() -> CGSize {
        UIScreen.main.bounds.size
    }
}

//
//  Animation.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 16.05.22.
//

import SwiftUI

//MARK: - Animation

extension Animation {
    static var openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static var closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
}

//
//  SearchButton.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 14.05.22.
//

import SwiftUI

//MARK: - SearchButton

struct SearchButton: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let sizeLogo: CGSize = .init(width: 19, height: 18)
        static let cornerButton: CGFloat = 14
        static let magnifyingglass = "magnifyingglass"
    }
    
    //MARK: Properties
    
    var body: some View {
        Image(systemName: InternalConstant.magnifyingglass)
            .font(.body.bold())
            .foregroundColor(.secondary)
            .frame(width: InternalConstant.sizeLogo.width,
                   height: InternalConstant.sizeLogo.height)
            .padding(GlobalConstant.Padding.step9)
            .background(.ultraThinMaterial,
                        in: RoundedRectangle(cornerRadius: InternalConstant.cornerButton,
                                             style: .continuous))
            .defaultStroke(InternalConstant.cornerButton)
            .defaultShadow()
    }
}

//MARK: - PreviewProvider

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchButton()
            SearchButton()
                .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}

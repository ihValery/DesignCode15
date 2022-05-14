//
//  CloseButton.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 14.05.22.
//

import SwiftUI

//MARK: - CloseButton

struct CloseButton: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let sizeLogo: CGSize = .init(width: 16, height: 18)
        static let xmark = "xmark"
    }
    
    //MARK: Properties

    var body: some View {
        Image(systemName: InternalConstant.xmark)
            .font(.body.bold())
            .foregroundColor(.secondary)
            .frame(width: InternalConstant.sizeLogo.width,
                   height: InternalConstant.sizeLogo.height)
            .padding(GlobalConstant.Padding.step8)
            .background(.ultraThinMaterial, in: Circle())
            .defaultStroke(.circle)
            .defaultShadow()
    }
}

//MARK: - PreviewProvider

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CloseButton()
            CloseButton()
                .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}

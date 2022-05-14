//
//  LogoButton.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 14.05.22.
//

import SwiftUI

//MARK: - LogoButton

struct LogoButton: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let sizeLogo: CGSize = .init(width: 26, height: 26)
        static let cornerLogo: CGFloat = 10
        static let cornerButton: CGFloat = 16
    }
    
    //MARK: Properties
    
    private let image: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: InternalConstant.sizeLogo.width,
                       height: InternalConstant.sizeLogo.height)
                .cornerRadius(InternalConstant.cornerLogo)
                .padding(GlobalConstant.Padding.step9)
                .background(.ultraThinMaterial,
                            in: RoundedRectangle(cornerRadius: InternalConstant.cornerButton,
                                                 style: .continuous))
                .defaultStroke(InternalConstant.cornerButton)
                .defaultShadow()
        }
    }
    
    //MARK: Initializer
    
    init(_ image: String) {
        self.image = image
    }
}

//MARK: - PreviewProvider

struct AvatarButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LogoButton(GlobalConstant.Avatar.avatarDefault)
            
            LogoButton(GlobalConstant.Avatar.avatarOne)
                .preferredColorScheme(.dark)

            LogoButton(GlobalConstant.Avatar.avatarThree)
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}

//
//  AvatarButton.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 14.05.22.
//

import SwiftUI

//MARK: - AvatarButton

struct AvatarButton: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let sizeAvatar: CGSize = .init(width: 26, height: 26)
    }
    
    //MARK: Properties
    
    private let image: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: InternalConstant.sizeAvatar.width,
                       height: InternalConstant.sizeAvatar.height)
                .cornerRadius(GlobalConstant.Corner.logo)
                .padding(GlobalConstant.Padding.step9)
                .background(.ultraThinMaterial,
                            in: RoundedRectangle(cornerRadius: GlobalConstant.Corner.buttonAvatar,
                                                 style: .continuous))
                .defaultStroke(GlobalConstant.Corner.buttonAvatar)
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
            AvatarButton(GlobalConstant.Avatar.avatarDefault)
            
            AvatarButton(GlobalConstant.Avatar.avatarOne)
                .preferredColorScheme(.dark)

            AvatarButton(GlobalConstant.Avatar.avatarThree)
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}

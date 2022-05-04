//
//  ContentView.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 2.05.22.
//

import SwiftUI

//MARK: - ContentView

struct ContentView: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let gradientForText = LinearGradient.init(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
        static let offsetBackground: CGSize = .init(width: 250, height: -100)
        static let offsetOverlay: CGSize = .init(width: 32, height: -80)
    }

    //MARK: Properties

    var body: some View {
        VStack(alignment: .leading, spacing: GlobalConstant.Padding.step8) {
            Spacer()
            
            Image(GlobalConstant.Logos.logo2)
                .resizable()
                .scaledToFit()
                .frame(width: GlobalConstant.Size.homeCardLogo.width,
                       height: GlobalConstant.Size.homeCardLogo.height)
                .cornerRadius(GlobalConstant.Corner.logo)
                .padding(GlobalConstant.Padding.step9)
                .background(.ultraThinMaterial,
                            in: RoundedRectangle(cornerRadius: GlobalConstant.Corner.logoBackground, style: .continuous)
                )
                .defaultStroke(GlobalConstant.Corner.logoBackground)
            
            DefaultTextView(GlobalConstant.Text.homeCardTitle,
                            font: .largeTitle, weight: .bold)
            .foregroundStyle(InternalConstant.gradientForText)
            
            DefaultTextView(GlobalConstant.Text.homeCardSubtitle.uppercased(),
                            font: .footnote, weight: .semibold)
            .foregroundStyle(.secondary)
            
            DefaultTextView(GlobalConstant.Text.homeCardDescription,
                            font: .footnote, weight: .semibold, lineLimit: 2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.secondary)
        }
        .padding(GlobalConstant.Padding.stepDefault)
        .padding(.vertical, GlobalConstant.Padding.stepDefault)
        .frame(height: GlobalConstant.Size.homeCard.height)
        .background(.ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: GlobalConstant.Corner.card, style: .continuous))
//        .mask(
//            RoundedRectangle(cornerRadius: GlobalConstant.Corner.card,
//                             style: .continuous)
//        )
        .defaultShadow()
        .defaultStroke()
        .padding(.horizontal, GlobalConstant.Padding.stepDefault)
        .background(
            GlobalConstant.Images.blobOne
                .offset(InternalConstant.offsetBackground)
        )
        .overlay(
            GlobalConstant.Images.illustration5
                .resizable()
                .scaledToFit()
                .frame(height: GlobalConstant.Size.homeCardImage.height)
                .offset(InternalConstant.offsetOverlay)
        )
        .onAppear {
            print("Hello ContentView")
        }
        .onDisappear {
            print("Bye ContentView")
        }
    }
}

//MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)

            ContentView()
                .previewLayout(.sizeThatFits)
        }
        .padding(.vertical, 20)
    }
}

//
//  ContentView.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 2.05.22.
//

import SwiftUI

//MARK: - ContentView

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: GlobalConstant.Padding.step8) {
            Spacer()
            
            Image(GlobalConstant.Logos.logo2)
                .resizable()
                .scaledToFit()
                .frame(width: GlobalConstant.Size.homeCardLogo.width,
                       height: GlobalConstant.Size.homeCardLogo.height)
                .cornerRadius(GlobalConstant.Corner.logo)
            
            DefaultTextView(GlobalConstant.Text.homeCardTitle,
                            font: .largeTitle, weight: .bold)
            
            DefaultTextView(GlobalConstant.Text.homeCardSubtitle.uppercased(),
                            font: .footnote, weight: .semibold)
            .foregroundColor(.secondary)
            
            DefaultTextView(GlobalConstant.Text.homeCardDescription,
                            font: .footnote, weight: .semibold, lineLimit: 2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.secondary)
        }
        .padding(GlobalConstant.Padding.stepDefault)
        .padding(.vertical, GlobalConstant.Padding.stepDefault)
        .frame(height: GlobalConstant.Size.homeCard.height)
        .background(Color.backgroundDefault)
        .cornerRadius(GlobalConstant.Corner.card)
        .shadow(color: .shadowDefault, radius: 20, x: 0, y: 10)
        .padding(.horizontal, GlobalConstant.Padding.stepDefault)
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

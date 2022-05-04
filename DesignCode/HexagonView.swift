//
//  HexagonView.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 3.05.22.
//

import SwiftUI

//MARK: - HexagonView

struct HexagonView: View {
    var body: some View {
        Canvas { contex, size in
//            contex.draw(Text("ihValery"), at: CGPoint(x: size.width / 2, y: size.height / 2 - 100))
//            contex.fill(Path(ellipseIn: CGRect(x: size.width / 2 - 50, y: size.height / 2, width: 100, height: 150)), with: .color(.green.opacity(0.2)))
//            contex.draw(Image(systemName: "heart.fill"), in: CGRect(x: size.width / 2 - 50, y: size.height / 2 - 50, width: 100, height: 100))
//            contex.draw(GlobalConstant.Images.blobOne, in: CGRect(x: 10, y: 10, width: 100, height: 190))
        }
        .foregroundColor(.red)
//        .frame(width: 300, height: 300)
    }
}

//MARK: - PreviewProvider

struct HexagonView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}

struct MyCustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.95417*width, y: 0.72093*height))
        path.addCurve(to: CGPoint(x: 0.50417*width, y: 0.93798*height), control1: CGPoint(x: 1.12917*width, y: 1.08915*height), control2: CGPoint(x: 0.73333*width, y: 1.00775*height))
        path.addCurve(to: CGPoint(x: 0.00417*width, y: 0.43411*height), control1: CGPoint(x: 0.1375*width, y: 0.82636*height), control2: CGPoint(x: 0.00417*width, y: 0.64817*height))
        path.addCurve(to: CGPoint(x: 0.67083*width, y: 0.01938*height), control1: CGPoint(x: 0.00417*width, y: 0.22004*height), control2: CGPoint(x: 0.09583*width, y: -0.06977*height))
        path.addCurve(to: CGPoint(x: 0.95417*width, y: 0.72093*height), control1: CGPoint(x: 0.95417*width, y: 0.06331*height), control2: CGPoint(x: 0.72917*width, y: 0.3062*height))
        path.closeSubpath()
        return path
    }
}

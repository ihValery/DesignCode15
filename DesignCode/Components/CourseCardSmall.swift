//
//  CourseCardSmall.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 16.05.22.
//

import SwiftUI

//MARK: - CourseCardSmall

struct CourseCardSmall: View {
    
    //MARK: Properties
    
private let course: CourseModel
    
    private var namespace: Namespace.ID
    
    var body: some View {
        headerCard
            .frame(maxWidth: .infinity, maxHeight: .infinity,  alignment: .bottom)
            .background(imageLogoCourse, alignment: .top)
            .background(imageBackground)
            .mask(cardForm)
            .frame(height: GlobalConstant.Size.homeCard.height - 50)
    }
    
    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            DefaultText(course.title, font: .largeTitle, weight: .bold, lineLimit: 2)
                .matchedGeometryEffect(id: "title\(course.id)", in: namespace)

            DefaultText(course.subtitle, font: .footnote, weight: .semibold)
                .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
            
            DefaultText(course.text, font: .footnote, weight: .semibold, lineLimit: 2)
                .matchedGeometryEffect(id: "text\(course.id)", in: namespace)
        }
        .padding(GlobalConstant.Padding.stepDefault)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .background(backgroundHeader)
    }
    
    private var backgroundHeader: some View {
        Rectangle()
            .fill(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: GlobalConstant.Corner.card, style: .continuous))
            .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
            .blur(radius: 30)
    }
    
    private var imageLogoCourse: some View {
        course.image
            .resizable()
            .scaledToFit()
            .padding(GlobalConstant.Padding.stepDefault)
            .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
    }
    
    private var imageBackground: some View {
        course.background
            .resizable()
            .scaledToFill()
            .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
    }
    
    private var cardForm: some View {
        RoundedRectangle(cornerRadius: GlobalConstant.Corner.card, style: .continuous)
        .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
    }
    
    //MARK: Initializer
    
    init(_ course: CourseModel,_ namespace: Namespace.ID) {
        self.course = course
        self.namespace = namespace
    }
}

//MARK: - PreviewProvider

struct CourseCardSmall_Previews: PreviewProvider {
    @Namespace static var namespace
    static let course = CourseVM().courses[1]
    
    static var previews: some View {
        Group {
            CourseCardSmall(course, namespace)
            CourseCardSmallPlug()
        }
        .previewLayout(.sizeThatFits)
        .previewDevice("iPhone 13 Pro")
    }
}

//MARK: - CourseCardSmall

struct CourseCardSmallPlug: View {
    var body: some View {
        Color.clear
            .frame(height: GlobalConstant.Size.homeCard.height - 50)
            .padding(.horizontal, GlobalConstant.Padding.stepDefault)
            .padding(.vertical)
    }
}

//
//  CourseItem.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 16.05.22.
//

import SwiftUI

//MARK: - CourseItem

struct CourseItem: View {
    
    //MARK: Properties
    
    private let course: CourseModel
    
    private var namespace: Namespace.ID
    
    var body: some View {
        headerCard
            .frame(maxWidth: .infinity, maxHeight: .infinity,  alignment: .bottom)
            .background(imageLogoCourse)
            .background(imageBackground)
            .mask(cardForm)
            .frame(height: GlobalConstant.Size.homeCard.height)
            .padding(.horizontal, GlobalConstant.Padding.stepDefault)
    }
    
    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            DefaultText(course.title, font: .largeTitle, weight: .bold)
                .matchedGeometryEffect(id: NSpaceCourseID.title, in: namespace)

            DefaultText(course.subtitle, font: .footnote, weight: .semibold)
                .matchedGeometryEffect(id: NSpaceCourseID.subtitle, in: namespace)
            
            DefaultText(course.text, font: .footnote, weight: .semibold, lineLimit: 2)
                .matchedGeometryEffect(id: NSpaceCourseID.text, in: namespace)
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
            .matchedGeometryEffect(id: NSpaceCourseID.blur, in: namespace)
            .blur(radius: 30)
            .offset(y: 25)
    }
    
    private var imageLogoCourse: some View {
        GlobalConstant.Images.illustration9
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: NSpaceCourseID.image, in: namespace)
    }
    
    private var imageBackground: some View {
        GlobalConstant.Images.background5
            .resizable()
            .scaledToFill()
            .matchedGeometryEffect(id: NSpaceCourseID.background, in: namespace)
    }
    
    private var cardForm: some View {
        RoundedRectangle(cornerRadius: GlobalConstant.Corner.card,
                         style: .continuous)
        .matchedGeometryEffect(id: NSpaceCourseID.mask, in: namespace)
    }
    
    //MARK: Initializer
    
    init(_ course: CourseModel,_ namespace: Namespace.ID) {
        self.course = course
        self.namespace = namespace
    }
}

//MARK: - PreviewProvider

struct CoursesItem_Previews: PreviewProvider {
    @Namespace static var namespace
    static let course = CourseVM().courses[0]
    
    static var previews: some View {
        CourseItem(course, namespace)
    }
}

//
//  DesignCodeApp.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 2.05.22.
//

import SwiftUI

@main
struct DesignCodeApp: App {
    @StateObject private var controlPanel = ControlPanelApp()
    @StateObject private var courseViewModel = CourseVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(controlPanel)
                .environmentObject(courseViewModel)
        }
    }
}

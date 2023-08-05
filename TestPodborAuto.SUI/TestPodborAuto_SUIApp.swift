//
//  TestPodborAuto_SUIApp.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 04.08.2023.
//

import SwiftUI

@main
struct TestPodborAuto_SUIApp: App {
    @StateObject var dataStore = DataStore()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(dataStore)
        }
    }
}

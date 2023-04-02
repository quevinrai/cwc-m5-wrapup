//
//  M5_Wrapup_ChallengeApp.swift
//  M5 Wrapup Challenge
//
//  Created by Quevin Bambasi on 4/1/23.
//

import SwiftUI

@main
struct M5_Wrapup_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(VideoViewModel())
        }
    }
}

//
//  App_SocialApp.swift
//  App-Social
//
//  Created by Natanael Diego on 12/04/21.
//

import SwiftUI

@main
struct App_SocialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: UserViewModel())
        }
    }
}

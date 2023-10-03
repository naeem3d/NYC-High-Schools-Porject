//
//  NY_HighschoolSwiftUI_By_async_awaitApp.swift
//  NY_HighschoolSwiftUI_By_async_await
//
//  Created by naeem alabboodi on 10/3/23.
//

import SwiftUI

@main
struct NY_HighschoolSwiftUI_By_async_awaitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(service: WebService())
        }
    }
}

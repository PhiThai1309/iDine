//
//  iDineApp.swift
//  iDine
//
//  Created by Phi Thai on 22/06/2022.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var cart = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(cart)
        }
    }
}

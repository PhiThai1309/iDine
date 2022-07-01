//
//  MainView.swift
//  iDine
//
//  Created by Phi Thai on 23/06/2022.
//

import SwiftUI

struct MainView: View {
    @State var view = 1
    
    var body: some View {
        TabView(selection: $view){
            ContentView()
                .tabItem{
                    Label("Menu", systemImage: "list.dash")
                }
                .tag(1)
            OrderView()
                .tabItem{
                    Label("Order", systemImage: "cart")
                }
                .tag(2)
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

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
        NavigationView{
            TabView(selection: $view){
                ContentView()
                    .tabItem{
                        Label("Menu", systemImage: "list.dash")
                    }
                    .tag(1)
                OrderView()
                    .tabItem{
                        Label("Order", systemImage: "list.dash")
                    }
                    .tag(2)
            }.navigationTitle((view == 1) ? "iDine": "Order")
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
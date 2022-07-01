//
//  ContentView.swift
//  iDine
//
//  Created by Phi Thai on 22/06/2022.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    ForEach(menu) { course in
                        Section{
                            ForEach(course.items) { food in
                                NavigationLink(destination: FoodDetails(food: food)){
                                    Label{
                                        Text(food.name)
                                        
                                    } icon: {
                                        Image(food.thumbnailImage)
                                            .clipShape(Circle())
                                    }
                                    Spacer()
                                    ForEach(food.restrictions, id: \.self){ restriction in
                                        Text(restriction)
                                    }
                                }
                            }
                        } header: {
                            Text(course.name)
                        }
                    }
                }
            }.navigationTitle("Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

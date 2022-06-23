//
//  FoodDetails.swift
//  iDine
//
//  Created by Phi Thai on 22/06/2022.
//

import SwiftUI
struct FoodDetails: View {
    @State var expandable = false
    @EnvironmentObject var cartItems: Order
    
    var food: MenuItem
    
    var body: some View {
        VStack(){
            Form{
                Section{
                    ZStack(alignment: .bottomTrailing){
                        Image(food.mainImage)
                            .renderingMode(.original)
                            .resizable()
                            .padding(.all, -20.0)
                        Text(food.photoCredit)
                            .background(.black)
                            .foregroundColor(.white)
                    }
                } header: {
                    Text("\(food.name) image")
                }
                Section {
                    HStack{
                        Spacer()
                        Button("more"){
                            expandable.toggle()
                        }
                    }
                    .listRowSeparator(.hidden)
                    VStack{
                        if(!expandable) {
                            Text(food.description)
                                .lineLimit(1)
                                .transition(.opacity)
                        } else {
                            Text(food.description)
                                .transition(.opacity)
                        }
                    }
                } header: {
                    Text("Discription")
                }.animation(.default)
                Section{
                    Text(food.price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.vertical)
                } header: {
                    Text("Price")
                }
                
                Section{
                    Button{
                        cartItems.add(item: food)
                        print(cartItems.items[0])
                    } label: {
                        Label("Add to cart", systemImage: "cart")
                    }
                }
                
                
            }
            }.navigationTitle(food.name)
            .navigationBarTitleDisplayMode(.inline)
    }

}

struct FoodDetails_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetails(food: MenuItem.example)
    }
}

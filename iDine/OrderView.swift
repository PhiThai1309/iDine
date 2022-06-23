//
//  OrderView.swift
//  iDine
//
//  Created by Phi Thai on 23/06/2022.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var cartItems: Order
    
    var body: some View {
        List{
            Section{
                ForEach(cartItems.items){ cartItem in
                    HStack{
                        NavigationLink(cartItem.name, destination: FoodDetails(food: cartItem))
                    }
                }
                .onDelete{indexSet in cartItems.items.remove(atOffsets: indexSet)}
            }
            Section{
                Text(cartItems.total, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            }
            Section{
                Button{
                    
                } label: {
                    Label("Order Now", systemImage: "arrow.right")
                }
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}

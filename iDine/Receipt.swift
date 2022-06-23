//
//  Receipt.swift
//  iDine
//
//  Created by Phi Thai on 23/06/2022.
//

import SwiftUI

struct Receipt: View {
    var firstName: String
    var lastName: String
    @EnvironmentObject var cartItems: Order
    @State var showView = false
    
    var body: some View {
        NavigationView{
            VStack{
                Section{
                    Text("First Name: \(firstName)")
                    Text("Last Name: \(lastName)")
                }
                Section{
                    ForEach(cartItems.items){ cartItem in
                        Text(cartItem.name)
                    }
                }header: {
                    Text("Your choosen dish")
                }
                Section{
                    Text(cartItems.total, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
                Section{
                    Text("Thank you for using our service")
                }
                Section{
                    Button{
                        cartItems.removeAll()
                        showView = true
                    } label: {
                        Text("Back to home")
                    }
                }
                NavigationLink("", destination: MainView(), isActive: $showView).hidden()
                
            }
        }.navigationTitle("Your order has confirm")
            .navigationBarBackButtonHidden(true)
    }
}

struct Receipt_Previews: PreviewProvider {
    static var previews: some View {
        Receipt(firstName: "", lastName: "")
    }
}

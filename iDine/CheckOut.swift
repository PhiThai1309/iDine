//
//  CheckOut.swift
//  iDine
//
//  Created by Phi Thai on 23/06/2022.
//

import SwiftUI

struct CheckOut: View {
    @State var firstName = ""
    @State var lastName = ""
    @EnvironmentObject var cartItems: Order
    
    var body: some View {
        Form{
            Section{
                TextField("Enter your first name", text: $firstName)
                TextField("Enter your last name", text: $lastName)
            }header: {
                Text("Personal Information")
            }
            Section{
                ForEach(cartItems.items){ cartItem in
                    Text(cartItem.name)
                }
            }header: {
                Text("Your order summary")
            }
            Section{
                NavigationLink(destination: Receipt(firstName: firstName, lastName: lastName)){
                    Text("Confirm Order")
                        .foregroundColor(.red)
                }
            }
        }.navigationTitle("Check Out")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckOut_Previews: PreviewProvider {
    static var previews: some View {
        CheckOut()
    }
}

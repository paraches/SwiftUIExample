//
//  CheckoutView.swift
//  SwiftUIExample
//
//  Created by paraches on 2019/11/23.
//  Copyright © 2019 paraches lifestyle lab. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    static let pickupTimes = ["Now", "Tonight", "Tomorrow Morning"]

    @EnvironmentObject var order: Order
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    @State private var pickupTime = 0

    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
        
    var body: some View {
        Form {
            Picker("How do you want to pay?", selection: $paymentType) {
                ForEach(0 ..< Self.paymentTypes.count) {
                    Text(Self.paymentTypes[$0])
                }
            }
            Toggle(isOn: $addLoyaltyDetails.animation()) {
                Text("Add iDine loyalty card")
            }
            if addLoyaltyDetails {
                TextField("Enter your iDine ID", text: $loyaltyNumber)
            }
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Picup time")) {
                Picker("time:", selection: $pickupTime) {
                    ForEach(0 ..< Self.pickupTimes.count) {
                        Text(Self.pickupTimes[$0])
                    }
                }
            }
            
            Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")")
                .font(.largeTitle)
            ) {
                Button("Confirm ordeer") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
            CheckoutView().environmentObject(order)
        }
    }
}

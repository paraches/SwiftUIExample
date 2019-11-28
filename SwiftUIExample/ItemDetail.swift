//
//  ItemDetail.swift
//  SwiftUIExample
//
//  Created by paraches on 2019/11/22.
//  Copyright © 2019 paraches lifestyle lab. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
            .padding()
            
            Button(action: {
                self.order.add(item: self.item)
            }) {
                HStack {
                    Image(systemName: "cart.badge.plus")
                    Text("Order This")
                        .font(.headline)
                }
            }
            .padding(8)
            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
            .cornerRadius(4)

            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}

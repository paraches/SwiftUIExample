//
//  AppView.swift
//  SwiftUIExample
//
//  Created by paraches on 2019/11/22.
//  Copyright © 2019 paraches lifestyle lab. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
        
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorite")
            }

        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static let userData = UserData()
    
    static var previews: some View {
        AppView().environmentObject(order).environmentObject(userData)
    }
}

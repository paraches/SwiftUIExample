//
//  FavoriteView.swift
//  SwiftUIExample
//
//  Created by paraches on 2019/11/28.
//  Copyright © 2019 paraches lifestyle lab. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var userData: UserData
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")

    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            if self.userData.isFavorite(item.id) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Favorite")
            .listStyle(GroupedListStyle())
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var userData = UserData()
    
    static var previews: some View {
        FavoriteView().environmentObject(userData)
    }
}

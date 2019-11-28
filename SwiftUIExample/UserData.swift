//
//  UserData.swift
//  SwiftUIExample
//
//  Created by paraches on 2019/11/28.
//  Copyright © 2019 paraches lifestyle lab. All rights reserved.
//

import Foundation

class UserData: ObservableObject {
    @Published var favorites: [UUID] = []
    
    func isFavorite(_ id: UUID) -> Bool {
        return favorites.contains(id)
    }
    
    func toggleFavorite(_ id: UUID) {
        if let index = favorites.firstIndex(of: id) {
            favorites.remove(at: index)
        }
        else {
            favorites.append(id)
        }
    }
}

//
//  Restaurant.swift
//  RxRestaurantsList
//
//  Created by Oscar Rodriguez Garrucho on 08/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation

struct Restaurant: Codable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Codable {
    case european
    case french
    case indian
    case mexican
    case english
}

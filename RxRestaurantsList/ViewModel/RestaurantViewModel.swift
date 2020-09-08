//
//  RestaurantViewModel.swift
//  RxRestaurantsList
//
//  Created by Oscar Rodriguez Garrucho on 08/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation

struct RestaurantViewModel {

    private var restaurant: Restaurant

    var displayText: String {
        return restaurant.name + " - " + restaurant.cuisine.rawValue.capitalized
    }

    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}

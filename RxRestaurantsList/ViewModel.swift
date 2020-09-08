//
//  ViewModel.swift
//  RxRestaurantsList
//
//  Created by Oscar Rodriguez Garrucho on 08/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation
import RxSwift

final class ViewModel {

    let title: String = "Restaurants"

    private let managerServices: ManagerServicesProtocol

    init(managerServices: ManagerServicesProtocol = ManagerServices()) {
        self.managerServices = managerServices
    }

    func fetchRestaurantsViewModels() -> Observable<[RestaurantViewModel]> {
        managerServices.fetchRestaurants().map { $0.map { RestaurantViewModel(restaurant: $0) } }
    }
}

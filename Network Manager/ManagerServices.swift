//
//  ManagerServices.swift
//  RxRestaurantsList
//
//  Created by Oscar Rodriguez Garrucho on 08/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation
import RxSwift

protocol ManagerServicesProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}

class ManagerServices: ManagerServicesProtocol {

    func fetchRestaurants() -> Observable<[Restaurant]> {

        return Observable.create { (observer) -> Disposable in
            guard let path = Bundle.main.path(forResource: "Restaurants", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }

            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path),
                                    options: .mappedIfSafe)
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                observer.onNext(restaurants)
            } catch {
                observer.onError(error)
            }

            return Disposables.create { }
        }
    }
}

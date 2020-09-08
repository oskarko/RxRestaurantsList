//
//  ViewController.swift
//  RxRestaurantsList
//
//  Created by Oscar Rodriguez Garrucho on 08/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    private var disposeBag = DisposeBag()

    static func instantiate() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController

        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let managerServices = ManagerServices()
        managerServices.fetchRestaurants().subscribe(
            onNext: { restaurants in
                print(restaurants)
        }, onError: { error in
            print(error)
        }).disposed(by: disposeBag)
    }
}


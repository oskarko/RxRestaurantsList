//
//  ViewController.swift
//  RxRestaurantsList
//
//  Created by Oscar Rodriguez Garrucho on 08/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private var disposeBag = DisposeBag()
    private var viewModel: ViewModel!
    @IBOutlet private weak var tableView: UITableView!

    static func instantiate(viewModel: ViewModel) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel

        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.contentInsetAdjustmentBehavior = .never
        tableView.tableFooterView = UIView()

        viewModel
            .fetchRestaurantsViewModels().observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in

                cell.textLabel?.text = viewModel.displayText
                
        }.disposed(by: disposeBag)
    }
}


//
//  SearchAirportViewController.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2021/12/20.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class SearchAirportViewController: UIViewController, Storyboardable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var roundHeadView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var viewModel: SearchCityViewPresentable!
    var viewModelBuilder: SearchCityViewPresentable.ViewModelBuilder!
    
    // MARK: - LiceCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundHeadView.backgroundColor = .mainTheme
        self.navigationItem.title = "Airport Search"
        
        viewModel = viewModelBuilder((
            searchText: searchTextField.rx.text.orEmpty.asDriver(), ()
        ))
    }
}


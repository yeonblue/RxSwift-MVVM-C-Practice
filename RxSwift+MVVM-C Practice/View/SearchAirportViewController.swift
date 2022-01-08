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
import Alamofire

class SearchAirportViewController: UIViewController, Storyboardable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var roundHeadView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let disposeBag = DisposeBag()
    private var viewModel: SearchCityViewPresentable!
    var viewModelBuilder: SearchCityViewPresentable.ViewModelBuilder!
    
    private lazy var dataSource =
    RxTableViewSectionedReloadDataSource<CityItemsSection>(
        configureCell: { _, tableView, indexPath, item in
            
        let cityCell = tableView
                .dequeueReusableCell(withIdentifier: AirportCityTableViewCell.reuseIdentifier,
                                     for: indexPath) as! AirportCityTableViewCell
            cityCell.configure(viewModel: item)
        return cityCell
    })
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = viewModelBuilder((
            searchText: searchTextField.rx.text.orEmpty.asDriver(),
            citySelected: tableView.rx.modelSelected(CityViewModel.self).asDriver()
        ))
        
        setupUI()
        setupTableView()
        bindUI()
        

    }
}

private extension SearchAirportViewController {
    func setupUI() {
        self.navigationItem.title = "Airport Search"
        roundHeadView.backgroundColor = .mainTheme
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "AirportCityTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: AirportCityTableViewCell.reuseIdentifier)
    }
    
    func bindUI() {
        self.viewModel
            .output
            .cities
            .drive(tableView.rx.items(dataSource: self.dataSource))
            .disposed(by: self.disposeBag)
    }
}

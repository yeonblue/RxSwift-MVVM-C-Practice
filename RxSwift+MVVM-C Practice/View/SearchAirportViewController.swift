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

class SearchAirportViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var roundHeadView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: SearchCityViewPresentable!
    
    // MARK: - LiceCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


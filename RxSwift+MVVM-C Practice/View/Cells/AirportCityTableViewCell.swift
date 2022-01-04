//
//  AirportCityTableViewCell.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2022/01/04.
//

import UIKit

class AirportCityTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    // MARK: - Properties
    static let reuseIdentifier = "AirportCityTableViewCell"
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(viewModel: CityViewPresentable) {
        cityLabel.text = viewModel.city
        locationLabel.text = viewModel.location
    }
}

//
//  AirportTableViewCell.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2022/01/08.
//

import UIKit

class AirportTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var airportNameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    
    // MARK: - Properties
    static let reuseIdentifier = "AirportTableViewCell"
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(model: SelectAirportViewPresentable) {
        airportNameLabel.text = model.name
        distanceLabel.text = model.formattedDistance
        countryLabel.text = model.address
        lengthLabel.text = model.runnwayLength
        
        self.selectionStyle = .none
    }
    
}

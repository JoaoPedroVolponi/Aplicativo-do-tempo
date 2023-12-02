//
//  DailyForecastTableViewCell.swift
//  Tempo
//
//  Created by João Pedro Rosada Volponi on 02/12/23.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {
    static let identifier: String = "DailyForecast"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

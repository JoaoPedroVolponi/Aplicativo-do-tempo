//
//  DailyForecastTableViewCell.swift
//  Tempo
//
//  Created by João Pedro Rosada Volponi on 02/12/23.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {
    static let identifier: String = "DailyForecast"
    
    // WeekDayLabel
    private lazy var weekDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TER"
        label.textColor = UIColor.whiteColor
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    // minTemperatureLabel
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "min 25°C"
        label.textColor = UIColor.whiteColor
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    // maxTemperatureLabel
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "max 30°C"
        label.textColor = UIColor.whiteColor
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    // IconImage
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "cloudIcon")
        return imageView
    }()
    
    // StackViewHorizontal
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weekDayLabel, iconImageView, minTemperatureLabel, maxTemperatureLabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        contentView.addSubview(stackView)
        
    }
    
    private func setConstraints() {
        // StackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}

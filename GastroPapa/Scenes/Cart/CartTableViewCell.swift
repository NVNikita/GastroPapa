//
//  CartTableViewCell.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 06.01.2026.
//

import UIKit

final class CartTableViewCell: UITableViewCell {
    
    lazy var dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var nameDishLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfSemibold17
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var priceDishlabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfSemibold15
        label.textColor = .orangeCustom
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        activateConsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(dishImageView)
        contentView.addSubview(nameDishLabel)
        contentView.addSubview(priceDishlabel)
        
        dishImageView.translatesAutoresizingMaskIntoConstraints = false
        nameDishLabel.translatesAutoresizingMaskIntoConstraints = false
        priceDishlabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func activateConsraints() {
        NSLayoutConstraint.activate([
            dishImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dishImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            dishImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            dishImageView.widthAnchor.constraint(equalToConstant: 70),
            
            nameDishLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
            nameDishLabel.leadingAnchor.constraint(equalTo: dishImageView.trailingAnchor, constant: 16),
            nameDishLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 74),
            nameDishLabel.heightAnchor.constraint(equalToConstant: 20),
            
            priceDishlabel.leadingAnchor.constraint(equalTo: nameDishLabel.leadingAnchor),
            priceDishlabel.topAnchor.constraint(equalTo: nameDishLabel.bottomAnchor, constant: 11),
            priceDishlabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(name: String, dishName: String, price: String) {
        self.dishImageView.image = UIImage(named: dishName)
        self.nameDishLabel.text = name
        self.priceDishlabel.text = price
    }
}

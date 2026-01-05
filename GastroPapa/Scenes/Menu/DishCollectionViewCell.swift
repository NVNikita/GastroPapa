//
//  DishCollectionViewCell.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 27.12.2025.
//

import UIKit

final class DishCollectionViewCell: UICollectionViewCell {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 30
        stackView.layer.masksToBounds = true
        return stackView
    }()
    
    private lazy var dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 85
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var nameDish: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var priceDish: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .systemOrange
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard dishImageView.bounds.width > 0 else { return }
        dishImageView.layer.cornerRadius = dishImageView.bounds.width / 2
    }
    
    private func setupUI() {
        contentView.addSubview(stackView)
        contentView.addSubview(dishImageView)
        stackView.addSubview(priceDish)
        stackView.addSubview(nameDish)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        dishImageView.translatesAutoresizingMaskIntoConstraints = false
        priceDish.translatesAutoresizingMaskIntoConstraints = false
        nameDish.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 51),
            
            priceDish.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            priceDish.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            priceDish.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            nameDish.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            nameDish.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            nameDish.bottomAnchor.constraint(equalTo: priceDish.topAnchor, constant: -10),
            
            dishImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            dishImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            dishImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dishImageView.heightAnchor.constraint(equalTo: dishImageView.widthAnchor)
        ])
    }
    
    func configure(with dish: MenuItemModel) {
        self.nameDish.text = dish.name
        self.priceDish.text = String("\(dish.price) ₽")
        self.dishImageView.image = UIImage(named: dish.imageName)
    }
}

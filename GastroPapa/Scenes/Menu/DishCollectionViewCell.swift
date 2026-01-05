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
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        return containerView
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
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var priceDish: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .orangeCustom
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
    
    private func setupUI() {
        contentView.addSubview(stackView)
        contentView.addSubview(dishImageView)
        stackView.addSubview(priceDish)
        stackView.addSubview(containerView)
        containerView.addSubview(nameDish)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        dishImageView.translatesAutoresizingMaskIntoConstraints = false
        priceDish.translatesAutoresizingMaskIntoConstraints = false
        nameDish.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 51),
            
            dishImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            dishImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            dishImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dishImageView.heightAnchor.constraint(equalTo: dishImageView.widthAnchor),
            
            priceDish.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            priceDish.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            priceDish.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            priceDish.heightAnchor.constraint(equalToConstant: 19),
            
            containerView.topAnchor.constraint(equalTo: dishImageView.bottomAnchor),
            containerView.bottomAnchor.constraint(equalTo: priceDish.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            
            nameDish.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            nameDish.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            nameDish.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            nameDish.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with dish: MenuItemModel) {
        self.nameDish.text = dish.name
        self.priceDish.text = String("\(Int(dish.price)) ₽")
        self.dishImageView.image = UIImage(named: dish.imageName)
    }
}

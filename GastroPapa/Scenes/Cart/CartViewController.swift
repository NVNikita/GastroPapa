//
//  CartViewController.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 30.12.2025.
//

import UIKit

final class CartViewController: UIViewController {
    
    //TODO: add title and navBackButton
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Тут пока пусто"
        label.textColor = .white
        label.font = .sfSemibold28
        label.textAlignment = .center
        return label
    }()
    
    private lazy var placeholderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .placeholderCart)
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private lazy var cartTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private lazy var completedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Оформить заказ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .sfSemibold17
        button.backgroundColor = .white
        button.layer.cornerRadius = 30
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(completedButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let countCells: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        activateConsraints()
        setupTableView()
    }
    
    private func setupUI() {
        view.backgroundColor = .grayBackground
        
        view.addSubview(placeholderImageView)
        view.addSubview(placeholderLabel)
        view.addSubview(completedButton)
        view.addSubview(cartTableView)
        
        //placeholderImageView.translatesAutoresizingMaskIntoConstraints = false
        //placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        completedButton.translatesAutoresizingMaskIntoConstraints = false
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTableView() {
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.backgroundColor = .clear
        
        cartTableView.register(CartTableViewCell.self, forCellReuseIdentifier: "itemCartCell")
    }
    
    private func activateConsraints() {
        NSLayoutConstraint.activate([
            placeholderImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeholderImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            placeholderImageView.heightAnchor.constraint(equalToConstant: 115),
            placeholderImageView.widthAnchor.constraint(equalToConstant: 115),
            
            placeholderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeholderLabel.topAnchor.constraint(equalTo: placeholderImageView.bottomAnchor, constant: 16),
            
            completedButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            completedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            completedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -41),
            completedButton.heightAnchor.constraint(equalToConstant: 70),
            
            cartTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            cartTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            cartTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            cartTableView.bottomAnchor.constraint(equalTo: completedButton.topAnchor, constant: -50),
            cartTableView.heightAnchor.constraint(equalToConstant: CGFloat(countCells * 102))
        ])
    }
    
    private func setupPlaceholder() {
        
    }
    
    @objc private func completedButtonTap() {
        
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCartCell", for: indexPath)
                as? CartTableViewCell else {
            return UITableViewCell()
        }
        
        cell.dishImageView.image = UIImage(resource: .burgersPapaBeef)
        cell.nameDishLabel.text = "Breakfast Casserole"
        cell.priceDishlabel.text = "$12.99"
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    
}

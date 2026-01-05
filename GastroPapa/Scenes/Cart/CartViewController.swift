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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        activateConsraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .grayBackground
        
        view.addSubview(placeholderImageView)
        view.addSubview(placeholderLabel)
        view.addSubview(completedButton)
        
        placeholderImageView.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        completedButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTableView() {
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        cartTableView.register(UITableViewCell.self, forCellReuseIdentifier: "itemCartCell")
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
            completedButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func setupPlaceholder() {
        
    }
    
    @objc private func completedButtonTap() {
        
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCartCell", for: indexPath)
        return cell
    }
    
    
}

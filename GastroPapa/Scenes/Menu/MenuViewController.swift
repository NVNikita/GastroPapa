//
//  MenuViewController.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 24.12.2025.
//

import UIKit

final class MenuViewController: UIViewController {
    
    private lazy var cartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "cart"), for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(cartButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var callButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "phone"), for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(callButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var customTitleVC: UILabel = {
        let label = UILabel()
        label.text = "Вкусная еда\nдля тебя"
        label.font = UIFont.sfBold32
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var searchTextField: UISearchTextField = {
        let searchTextField = UISearchTextField()
        searchTextField.placeholder = "Поиск"
        searchTextField.tintColor = .white
        searchTextField.backgroundColor = .lightGray
        searchTextField.textColor = .white
        searchTextField.layer.cornerRadius = 30
        searchTextField.layer.masksToBounds = true
        return searchTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        activateConstraints()
        setupCollections()
        print("Запустились и работаем")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("Safe area insets: \(view.safeAreaInsets)")
        print("Layout margins: \(view.layoutMargins)")
        print("Cart button frame: \(cartButton.frame)")
        print("Cart button bounds: \(cartButton.bounds)")
        print("Is cart button in view bounds: \(view.bounds.contains(cartButton.frame))")
    }
    
    private func setupUI() {
        view.backgroundColor = .grayBackground
        
        view.addSubview(customTitleVC)
        view.addSubview(searchTextField)
        view.addSubview(menuCollectionView)
        view.addSubview(cartButton)
        view.addSubview(callButton)
        
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        callButton.translatesAutoresizingMaskIntoConstraints = false
        customTitleVC.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupCollections() {
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.register(DishCollectionViewCell.self, forCellWithReuseIdentifier: "dishCell")
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            cartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -41),
            cartButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            cartButton.heightAnchor.constraint(equalToConstant: 44),
            cartButton.widthAnchor.constraint(equalToConstant: 44),
            
            callButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            callButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 41),
            callButton.heightAnchor.constraint(equalToConstant: 44),
            callButton.widthAnchor.constraint(equalToConstant: 44),
            
            customTitleVC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            customTitleVC.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            customTitleVC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -179),
            customTitleVC.heightAnchor.constraint(equalToConstant: 125),
            
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchTextField.topAnchor.constraint(equalTo: customTitleVC.bottomAnchor, constant: 28),
            searchTextField.heightAnchor.constraint(equalToConstant: 60),
            
            menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            menuCollectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 120)
        ])
    }
    
    @objc private func cartButtonTap() {
        print("cart button tap")
        let cartVC = CartViewController()
        cartVC.modalPresentationStyle = .fullScreen
        present(cartVC, animated: true)
    }
    
    @objc private func callButtonTap() {
        print("call button tap")
    }
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dishCell", for: indexPath) as? DishCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 320)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 34
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
    }
}

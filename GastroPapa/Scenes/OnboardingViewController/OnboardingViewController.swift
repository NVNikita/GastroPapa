//
//  OnboardingViewController.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 18.12.2025.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 30
        stackView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        stackView.backgroundColor = .white
        return stackView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(resource: .gastroLogo)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var labelTopStackView: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfSemibold18
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Регистрация"
        return label
    }()
    
    private lazy var nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваше имя"
        label.font = UIFont.sfSemibold15
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .no
        textField.borderStyle = .none
        textField.textColor = .white
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = .white
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        textField.addSubview(bottomLine)
        
        NSLayoutConstraint.activate([
            bottomLine.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            bottomLine.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        return textField
    }()
    
    private lazy var emailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш email"
        label.font = UIFont.sfSemibold15
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        textField.borderStyle = .none
        textField.textColor = .white
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = .white
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        textField.addSubview(bottomLine)
        
        NSLayoutConstraint.activate([
            bottomLine.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            bottomLine.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        return textField
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Готово", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.sfSemibold18
        button.layer.cornerRadius = 30
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        activateConstarints()
    }
    
    private func setupUI() {
        view.backgroundColor = .grayBacground
        
        view.addSubview(topStackView)
        view.addSubview(nameStackView)
        view.addSubview(emailStackView)
        view.addSubview(loginButton)
        
        topStackView.addSubview(logoImageView)
        topStackView.addSubview(labelTopStackView)
        
        nameStackView.addSubview(nameLabel)
        nameStackView.addSubview(nameTextField)
        emailStackView.addSubview(emailLabel)
        emailStackView.addSubview(emailTextField)
        
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        labelTopStackView.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func activateConstarints() {
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topStackView.heightAnchor.constraint(equalToConstant: 382),
            
            logoImageView.centerXAnchor.constraint(equalTo: topStackView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: topStackView.centerYAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            
            labelTopStackView.centerXAnchor.constraint(equalTo: topStackView.centerXAnchor),
            labelTopStackView.bottomAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: -15),
            
            nameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 64),
            nameStackView.heightAnchor.constraint(equalToConstant: 59),
            
            emailStackView.leadingAnchor.constraint(equalTo: nameStackView.leadingAnchor),
            emailStackView.trailingAnchor.constraint(equalTo: nameStackView.trailingAnchor),
            emailStackView.heightAnchor.constraint(equalToConstant: 59),
            emailStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 46),
            
            nameLabel.leadingAnchor.constraint(equalTo: nameStackView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: nameStackView.topAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: nameStackView.trailingAnchor, constant: 211),
            nameLabel.heightAnchor.constraint(equalToConstant: 18),
            
            emailLabel.leadingAnchor.constraint(equalTo: emailStackView.leadingAnchor),
            emailLabel.topAnchor.constraint(equalTo: emailStackView.topAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: emailStackView.trailingAnchor, constant: 211),
            emailLabel.heightAnchor.constraint(equalToConstant: 18),
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 70),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 9),
            nameTextField.leadingAnchor.constraint(equalTo: nameStackView.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: nameStackView.trailingAnchor),
            nameTextField.bottomAnchor.constraint(equalTo: nameStackView.bottomAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 9),
            emailTextField.leadingAnchor.constraint(equalTo: emailStackView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailStackView.trailingAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: emailStackView.bottomAnchor)
        ])
    }
    
    @objc
    private func loginButtonTap() {
        
    }
}

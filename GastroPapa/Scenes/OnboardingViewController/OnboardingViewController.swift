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
        let attributedTitle = NSAttributedString(
            string: "Я просто посмотреть",
            attributes: [
                .font: UIFont.sfSemibold17,
                .foregroundColor: UIColor.white,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(skipButtonTap), for: .touchUpInside)
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
        setupTextFields()
        activateConstarints()
    }
    
    private func setupUI() {
        view.backgroundColor = .grayBackground
        
        view.addSubview(topStackView)
        view.addSubview(nameStackView)
        view.addSubview(emailStackView)
        view.addSubview(skipButton)
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
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
    }
    
    private func setupTextFields() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
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
            
            skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skipButton.topAnchor.constraint(equalTo: emailStackView.bottomAnchor, constant: 40),
            skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            skipButton.heightAnchor.constraint(equalToConstant: 44),
            
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
    
    private func isValidName(_ name: String) -> Bool {
        let trimmedName = name.trimmingCharacters(in: .whitespaces)
        if trimmedName.isEmpty || trimmedName.count < 2 { return false }
        let nameRegEx = "^[a-zA-Zа-яА-ЯёЁ\\s]+$"
        let namePred = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        return namePred.evaluate(with: trimmedName)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let trimmedEmail = email.trimmingCharacters(in: .whitespaces)
        if trimmedEmail.isEmpty { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: trimmedEmail)
    }
    
    private func updateLoginButtonState() {
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        let IsNameValid = isValidName(name)
        let IsEmailValid = isValidEmail(email)
        
        loginButton.isEnabled = IsNameValid && IsEmailValid
        loginButton.alpha = (IsNameValid && IsEmailValid) ? 1.0 : 0.5
    }
    
    @objc
    private func loginButtonTap() {
        
    }
    
    @objc
    private func skipButtonTap() {
        
    }
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        // обновляем цвет линии при каждом изменении текста
        updateLineColor(for: textField)
        updateLoginButtonState()
    }

    private func updateLineColor(for textField: UITextField) {
        let text = textField.text ?? ""
        let bottomLine = textField.subviews.first { $0.backgroundColor == .white || $0.backgroundColor == .red || $0.backgroundColor == .green }
        
        if text.isEmpty {
            bottomLine?.backgroundColor = .white
        } else {
            let isValid = textField == nameTextField ?
                isValidName(text) : isValidEmail(text)
            bottomLine?.backgroundColor = isValid ? .green : .red
        }
    }
}

extension OnboardingViewController: UITextFieldDelegate  {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // при завершении редактирования проверяем и показываем ошибки
        updateLineColor(for: textField)
        updateLoginButtonState()

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // валидация по мере ввода
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.updateLoginButtonState()
        }
        return true
    }
}

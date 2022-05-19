//
//  LogInViewController.swift
//  Navigation
//
//  Created by apple on 20.04.2022.
//

import UIKit
import Foundation

class LogInViewController: UIViewController {
    
    private let nc = NotificationCenter.default
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private let imageLogo: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.image = UIImage(named: "logo")
        return imageLogo
    }()
    
    private let textContent: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 0.5
        $0.clipsToBounds = true
        return $0
    }(UIStackView())
    
    private lazy var textFieldName: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.backgroundColor = .systemGray6
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 0.5
        $0.autocapitalizationType = .none
        $0.delegate = self
        $0.placeholder = "Enter your email"
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        return $0
    }(UITextField())
    
    private lazy var textFieldPassword: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.backgroundColor = .systemGray6
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 0.5
        $0.autocapitalizationType = .none
        $0.delegate = self
        $0.placeholder = "Enter your password"
        $0.isSecureTextEntry = true
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        return $0
    }(UITextField())
    
    private let errorText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .red
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.text = " "
        $0.isUserInteractionEnabled = false
        return $0
    }(UILabel())
    
    private let buttonLogIn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapAction() {
        
        if textFieldName.text!.isEmpty && textFieldPassword.text!.isEmpty {
            UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .curveEaseInOut]) { [self] in
                textFieldName.backgroundColor = .systemGray5
                textFieldPassword.backgroundColor = .systemGray5
            } completion: { [self] _ in
                textFieldName.backgroundColor = .systemGray6
                textFieldPassword.backgroundColor = .systemGray6
            }
            
        } else if isValidEmail(email: textFieldName.text!) == false  {
            let alert = UIAlertController(title: "Incorrect email", message: "Enter a valid email address", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Try again", style: .default) { [self] _ in
                textFieldName.text!.removeAll()
            }
            alert.addAction(okAction)
            present(alert, animated: true)
            
        } else if textFieldPassword.text!.count < 6  {
            errorText.text = "Short password"
            
        } else if isValidPassword(password: textFieldPassword.text!) == false  {
            let alert = UIAlertController(title: "Incorrect password", message: "Password does not meet security requirements", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Try again", style: .default) { [self] _ in
                textFieldPassword.text!.removeAll()
            }
            alert.addAction(okAction)
            present(alert, animated: true)
            
        } else {
            if textFieldName.text! != "test@gmail.com" {
                let alert = UIAlertController(title: "Incorrect email or password", message: "Please try again", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Try again", style: .default) { [self] _ in
                    textFieldName.text!.removeAll()
                    textFieldPassword.text!.removeAll()
                }
                alert.addAction(okAction)
                present(alert, animated: true)
            } else if textFieldPassword.text != "Qwer!@34" {
                let alert = UIAlertController(title: "Incorrect email or password", message: "Please try again", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Try again", style: .default) { [self] _ in
                    textFieldName.text!.removeAll()
                    textFieldPassword.text!.removeAll()
                }
                alert.addAction(okAction)
                present(alert, animated: true)
            } else {
                let profile = ProfileViewController()
                navigationController?.pushViewController(profile, animated: true)
            }
        }
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    private func isValidPassword(password: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
        closeKbd()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func closeKbd() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKbd))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func hideKbd() {
        view.endEditing(true)
    }
    
    private func layout() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [textFieldName, textFieldPassword].forEach { textContent.addSubview($0) }
        [imageLogo, textContent, errorText, buttonLogIn].forEach { contentView.addSubview($0) }
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: textContent.topAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: textContent.leadingAnchor),
            textFieldName.trailingAnchor.constraint(equalTo: textContent.trailingAnchor),
            textFieldName.heightAnchor.constraint(equalToConstant: 50),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldName.bottomAnchor),
            textFieldPassword.leadingAnchor.constraint(equalTo: textContent.leadingAnchor),
            textFieldPassword.trailingAnchor.constraint(equalTo: textContent.trailingAnchor),
            textFieldPassword.bottomAnchor.constraint(equalTo: textContent.bottomAnchor),
            textFieldPassword.heightAnchor.constraint(equalToConstant: 50),
            
            imageLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            imageLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageLogo.heightAnchor.constraint(equalToConstant: 100),
            imageLogo.widthAnchor.constraint(equalToConstant: 100),
            
            textContent.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 120),
            textContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textContent.heightAnchor.constraint(equalToConstant: 100),
            
            errorText.topAnchor.constraint(equalTo: textContent.bottomAnchor, constant: 8),
            errorText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            errorText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            buttonLogIn.topAnchor.constraint(equalTo: errorText.bottomAnchor, constant: 16),
            buttonLogIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonLogIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
            buttonLogIn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -16)
        ])
        
    }
    
}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    
}

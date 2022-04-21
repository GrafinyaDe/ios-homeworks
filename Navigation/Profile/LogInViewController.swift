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
        $0.placeholder = "Email or Phone"
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
        $0.placeholder = "Password"
        $0.isSecureTextEntry = true
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        return $0
    }(UITextField())
    
    private let buttonLogIn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
//                button.backgroundColor = UIColor(rgb: 0x4787cd, alpha: 1)
        //        button.backgroundColor = UIColor(rgb: 0x4787cd, alpha: 0.8)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapAction() {
        let profile = ProfileViewController()
        navigationController?.pushViewController(profile, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    private func layout() {
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        [textFieldName, textFieldPassword].forEach { textContent.addSubview($0) }
        
        NSLayoutConstraint.activate([
            textFieldName.topAnchor.constraint(equalTo: textContent.topAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: textContent.leadingAnchor),
            textFieldName.trailingAnchor.constraint(equalTo: textContent.trailingAnchor),
            textFieldName.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            textFieldPassword.topAnchor.constraint(equalTo: textFieldName.bottomAnchor),
            textFieldPassword.leadingAnchor.constraint(equalTo: textContent.leadingAnchor),
            textFieldPassword.trailingAnchor.constraint(equalTo: textContent.trailingAnchor),
            textFieldPassword.bottomAnchor.constraint(equalTo: textContent.bottomAnchor),
            textFieldPassword.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        [imageLogo, textContent, buttonLogIn].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            imageLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageLogo.heightAnchor.constraint(equalToConstant: 100),
            imageLogo.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            textContent.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 120),
            textContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textContent.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            buttonLogIn.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 16),
            buttonLogIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonLogIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
            buttonLogIn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}


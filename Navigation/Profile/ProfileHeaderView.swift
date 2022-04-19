//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by apple on 18.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    func loadView() {
        
        layout()
    }
    
    private let avatarImageView: UIImageView = {
        let avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.backgroundColor = .white
        avatar.image = UIImage(named: "file_77812")
        avatar.contentMode = .scaleAspectFill
        avatar.clipsToBounds = true
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.borderWidth = 3
        avatar.layer.cornerRadius = 50
        return avatar
    }()
    
    private let fullNameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Crazy"
        name.font = UIFont.boldSystemFont(ofSize: 18)
        name.textAlignment = .left
        name.textColor = .black
        return name
    }()
    
    private let statusLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "i drink and think"
        name.font = UIFont.systemFont(ofSize: 14)
        name.textAlignment = .left
        name.textColor = .gray
        return name
    }()
    
    private let statusTextField: UITextField = {
        let name = UITextField()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.systemFont(ofSize: 15)
        name.textColor = .black
        name.backgroundColor = .white
        name.layer.cornerRadius = 12
        name.layer.borderWidth = 1
        name.layer.borderColor = UIColor.black.cgColor
        name.textAlignment = .left
        name.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        name.leftViewMode = .always
        name.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return name
    }()
    
    @objc func statusTextChanged(_ textField: UITextField){
        
        statusText = textField.text ?? "Введите свой статус"
    }
    
    private let setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    @objc func buttonPressed() {
        
        statusLabel.text = statusText
    }
    
    private var statusText: String = ""
    
    private func layout() {
        [avatarImageView, fullNameLabel, statusLabel, statusTextField, setStatusButton].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 120),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 120),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -70),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 120),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 15),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            setStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
}





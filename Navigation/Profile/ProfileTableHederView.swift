//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by apple on 18.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
        
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
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        layout()
        backgroundColor = .white
        setGesture()
        kbdClose()
    }
    
    
    private func kbdClose() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(kbdHide))
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func kbdHide() {
        endEditing(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var backView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.frame = UIScreen.main.bounds
        $0.backgroundColor = .gray
        $0.alpha = 0.0
        return $0
    }(UIView())
    
    private var button: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.alpha = 0.0
        $0.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    @objc private func cancelAction() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) { [self] in
            button.alpha = 0.0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) { [self] in
                
                backView.alpha = 0.0
                avatarImageView.layer.cornerRadius = 50
                avatarX.constant = 66
                avatarY.constant = 66
                avatarWight.constant = 100
                avatarHeight.constant = 100
                
                layoutIfNeeded()
            }
        }
    }
    
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGesture)
        addSubview(backView)
    }
    
    @objc private func tapAction() {
        
        addSubview(button)
        bringSubviewToFront(avatarImageView)
        
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) { [self] in
            
            backView.alpha = 0.7
            avatarImageView.layer.cornerRadius = 0
            avatarX.constant = UIScreen.main.bounds.width / 2
            avatarY.constant = UIScreen.main.bounds.height / 2
            avatarWight.constant = UIScreen.main.bounds.width
            avatarHeight.constant = UIScreen.main.bounds.width
            layoutIfNeeded()
            
        } completion: { _ in
            UIView.animate(withDuration: 0.3) { [self] in
                button.alpha = 1.0
            }
        }
    }
    
    private var avatarWight = NSLayoutConstraint()
    private var avatarHeight = NSLayoutConstraint()
    private var avatarX = NSLayoutConstraint()
    private var avatarY = NSLayoutConstraint()
    
    private func layout() {
        
        [avatarImageView, fullNameLabel, statusLabel, statusTextField, setStatusButton].forEach { addSubview($0) }
        
        avatarX = avatarImageView.centerXAnchor.constraint(equalTo: leadingAnchor, constant: 66)
        avatarY = avatarImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 66)
        avatarWight = avatarImageView.widthAnchor.constraint(equalToConstant: 100)
        avatarHeight = avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([
            avatarX,
            avatarY,
            avatarWight,
            avatarHeight
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo:  topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 120),
            fullNameLabel.trailingAnchor.constraint(equalTo:  trailingAnchor, constant: 0),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant:  16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 120),
            statusLabel.trailingAnchor.constraint(equalTo:  trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 120),
            statusTextField.trailingAnchor.constraint(equalTo:  trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo:  leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo:  trailingAnchor, constant: -16),
            setStatusButton.bottomAnchor.constraint(equalTo:  bottomAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}





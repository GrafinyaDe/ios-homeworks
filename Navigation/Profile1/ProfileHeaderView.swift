//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by apple on 18.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let viewImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 16, y: 80, width: 100, height: 100))
        image.backgroundColor = .white
        image.image = UIImage(named: "file_77812")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.layer.cornerRadius = 50
        return image
    }()
    
    let nameProfile: UILabel = {
        let name = UILabel(frame: CGRect(x: 150, y: 91, width: 200, height: 25))
        name.text = "Crazy"
        name.font = UIFont.boldSystemFont(ofSize: 18)
        name.textAlignment = .left
        name.textColor = .black
        return name
    }()
    
    let status: UILabel = {
        let name = UILabel(frame: CGRect(x: 150, y: 137, width: 200, height: 25))
        name.text = "i drink and think"
        name.font = UIFont.systemFont(ofSize: 14)
        name.textAlignment = .left
        name.textColor = .gray
        return name
    }()
    
    let setStatus: UITextField = {
        let name = UITextField(frame: CGRect(x: 160, y: 172, width: 200, height: 40))
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
    
    let buttonShowStatus: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 228, width: Int(UIScreen.main.bounds.width - 32), height: 50))
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .application)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    func addView() {
        addSubview(viewImage)
        addSubview(nameProfile)
        addSubview(status)
        addSubview(buttonShowStatus)
        addSubview(setStatus)
    }
    
    
    @objc func buttonPressed() {
        status.text = statusText
    }
    private var statusText: String = ""
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? "Введите свой статус"
    }
}





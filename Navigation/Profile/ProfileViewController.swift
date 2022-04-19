//
//  ProfileViewController.swift
//  Navigation
//
//  Created by apple on 13.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        layout()
        viewHeader.loadView()

    }
    
    private let viewHeader: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var newButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("New button", for: .normal)
        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = 15
        return button
    }()
    
    private func layout() {
        [viewHeader, newButton].forEach { view.addSubview($0) }
//        view.addSubview(viewHeader)
        
        NSLayoutConstraint.activate([
            viewHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            viewHeader.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
            viewHeader.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        NSLayoutConstraint.activate([
            newButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            newButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
   
    
}




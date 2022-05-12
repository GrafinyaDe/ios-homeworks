//
//  FeedViewController.swift
//  Navigation
//
//  Created by apple on 13.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    private var buttonOne: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("One", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    private var buttonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Two", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapButton() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        layout()
        
    }
    
    private func layout() {
        view.addSubview(stackView)
        [buttonOne, buttonTwo].forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            buttonOne.heightAnchor.constraint(equalToConstant: 25),
            buttonOne.widthAnchor.constraint(equalToConstant: 100)
            
        ])
        
        NSLayoutConstraint.activate([
            buttonTwo.heightAnchor.constraint(equalToConstant: 25),
            buttonTwo.widthAnchor.constraint(equalToConstant: 100)
            
        ])
    }
    
}

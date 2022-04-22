//
//  PostViewController.swift
//  Navigation
//
//  Created by apple on 13.04.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        makeBarButton()
    }
    private func makeBarButton() {
        let barButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = barButton
        
    }
    
    @objc private func tapAction() {
        let info = InfoViewController()
        present(info, animated: true)
    }
}

//
//  FeedViewController.swift
//  Navigation
//
//  Created by apple on 13.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Новости")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        makeButton()
        
    }
    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle(post.title, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(tapButton) , for: .touchUpInside)
        view.addSubview(button)
    }
    @objc private func tapButton() {
        let postViewController = PostViewController()
        postViewController.title = post.title
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
}

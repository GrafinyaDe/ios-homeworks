//
//  DetailVCViewController.swift
//  Navigation
//
//  Created by apple on 16.05.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIScrollView())
    
    private var contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    private var postImage:  UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private var autorLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private var descriptionPost: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .systemGray
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
        setupView()
        
    }
    
    private func setupView() {
        navigationController?.navigationItem.title = "Detail"
        navigationController?.navigationBar.isHidden = false
        
    }
    
    func setupVC(image: UIImageView, autor: UILabel, description: UILabel) {
        postImage.image = image.image
        autorLabel.text = autor.text
        descriptionPost.text = description.text
    }
    
    private func layout() {
        let insets: CGFloat = 16
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [autorLabel, postImage, descriptionPost].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            autorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: insets),
            autorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: insets),
            autorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -insets),
            
            postImage.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: insets),
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: insets),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -insets),
            postImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            descriptionPost.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: insets),
            descriptionPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: insets),
            descriptionPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -insets),
            descriptionPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -insets)
            
            
        ])
    }
    
}

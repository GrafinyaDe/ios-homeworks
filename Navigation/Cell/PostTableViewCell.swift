//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by apple on 22.04.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private var autorPostLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        $0.numberOfLines = 2
        return $0
    }(UILabel())
    
    private var imagePostView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .black
        return $0
    }(UIImageView())
    
    private var descriptionPost: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .systemGray
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private var likesPostLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private var viewvPostLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private var stackLikeViews: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 32
        return $0
    }(UIStackView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ post: Post) {
        autorPostLabel.text = post.autor
        imagePostView.image = post.image
        descriptionPost.text = post.description
        likesPostLabel.text = "Likes:" + " " + String(post.likes)
        viewvPostLabel.text = "Views:" + " " + String(post.views)
    }
    
    private func layout() {
        
        let inset: CGFloat = 16
        let weight = UIScreen.main.bounds.width
        
        [likesPostLabel, viewvPostLabel].forEach { stackLikeViews.addSubview($0) }
        
        NSLayoutConstraint.activate([
            likesPostLabel.topAnchor.constraint(equalTo: stackLikeViews.topAnchor),
            likesPostLabel.leadingAnchor.constraint(equalTo: stackLikeViews.leadingAnchor),
            likesPostLabel.bottomAnchor.constraint(equalTo: stackLikeViews.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            viewvPostLabel.topAnchor.constraint(equalTo: stackLikeViews.topAnchor),
            viewvPostLabel.trailingAnchor.constraint(equalTo: stackLikeViews.trailingAnchor),
            viewvPostLabel.bottomAnchor.constraint(equalTo: stackLikeViews.bottomAnchor),
        ])
        
        [autorPostLabel, imagePostView, descriptionPost, stackLikeViews].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            autorPostLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            autorPostLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            autorPostLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset)
        ])
        
        NSLayoutConstraint.activate([
            imagePostView.topAnchor.constraint(equalTo: autorPostLabel.bottomAnchor, constant: inset),
            imagePostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagePostView.heightAnchor.constraint(equalToConstant: weight)
        ])
        
        NSLayoutConstraint.activate([
            descriptionPost.topAnchor.constraint(equalTo: imagePostView.bottomAnchor, constant: inset),
            descriptionPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            stackLikeViews.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: inset),
            stackLikeViews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            stackLikeViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            stackLikeViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }
}

//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by apple on 22.04.2022.
//

import UIKit

protocol PostTableViewCellDelegate: AnyObject {
    
    func viewDetailVC(image: UIImageView, autor: UILabel, description: UILabel)
    
}

class PostTableViewCell: UITableViewCell {
    
    weak var delegate: PostTableViewCellDelegate?
        
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
        $0.isUserInteractionEnabled = true
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
        $0.text = "Likes: "
        $0.isUserInteractionEnabled = true

        return $0
    }(UILabel())
    
    private var viewsPostLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
        $0.text = "Views: "
        return $0
    }(UILabel())
    
    private var likesPostInt: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
        $0.isUserInteractionEnabled = true
        return $0
    }(UILabel())
    
    private var viewsPostInt: UILabel = {
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
        setGesture()
        setGestureLikes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ post: Post) {
        autorPostLabel.text = post.autor
        imagePostView.image = post.image
        descriptionPost.text = post.description
        likesPostInt.text = String(post.likes)
        viewsPostInt.text = String(post.views)
    }
    
    private func setGesture() {
        let tapGestureImage = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        imagePostView.addGestureRecognizer(tapGestureImage)
    }
    private func setGestureLikes() {
        let tapGestureLikes = UITapGestureRecognizer(target: self, action: #selector(tapLikes))
        likesPostInt.addGestureRecognizer(tapGestureLikes)
        likesPostLabel.addGestureRecognizer(tapGestureLikes)
    }

    @objc private func tapImage() {
        var views = Int(viewsPostInt.text!)!
        views += 1
        viewsPostInt.text = String(views)

        delegate?.viewDetailVC(image: imagePostView, autor: autorPostLabel, description: descriptionPost)

    }
    
    @objc private func tapLikes() {

        var likes = Int(likesPostInt.text!)!
        likes += 1
        likesPostInt.text = String(likes)
    }
    
    private func layout() {
        
        let inset: CGFloat = 16
        let weight = UIScreen.main.bounds.width
        
        [likesPostLabel, likesPostInt, viewsPostLabel, viewsPostInt].forEach { stackLikeViews.addSubview($0) }
        
        NSLayoutConstraint.activate([
            likesPostLabel.topAnchor.constraint(equalTo: stackLikeViews.topAnchor),
            likesPostLabel.leadingAnchor.constraint(equalTo: stackLikeViews.leadingAnchor),
            likesPostLabel.bottomAnchor.constraint(equalTo: stackLikeViews.bottomAnchor),
            
            likesPostInt.topAnchor.constraint(equalTo: stackLikeViews.topAnchor),
            likesPostInt.leadingAnchor.constraint(equalTo: likesPostLabel.trailingAnchor),
            likesPostInt.bottomAnchor.constraint(equalTo: stackLikeViews.bottomAnchor),
        
            viewsPostLabel.topAnchor.constraint(equalTo: stackLikeViews.topAnchor),
            viewsPostLabel.bottomAnchor.constraint(equalTo: stackLikeViews.bottomAnchor),
            
            viewsPostInt.topAnchor.constraint(equalTo: stackLikeViews.topAnchor),
            viewsPostInt.leadingAnchor.constraint(equalTo: viewsPostLabel.trailingAnchor),
            viewsPostInt.bottomAnchor.constraint(equalTo: stackLikeViews.bottomAnchor),
            viewsPostInt.trailingAnchor.constraint(equalTo: stackLikeViews.trailingAnchor)
            
        ])
        
        [autorPostLabel, imagePostView, descriptionPost, stackLikeViews].forEach { contentView.addSubview($0) }
        contentView.bringSubviewToFront(likesPostInt)
        
        NSLayoutConstraint.activate([
            autorPostLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            autorPostLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            autorPostLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        
            imagePostView.topAnchor.constraint(equalTo: autorPostLabel.bottomAnchor, constant: inset),
            imagePostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagePostView.heightAnchor.constraint(equalToConstant: weight),
     
            descriptionPost.topAnchor.constraint(equalTo: imagePostView.bottomAnchor, constant: inset),
            descriptionPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
       
            stackLikeViews.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: inset),
            stackLikeViews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            stackLikeViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            stackLikeViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }
}


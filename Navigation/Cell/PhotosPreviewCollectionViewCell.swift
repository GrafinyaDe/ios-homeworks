//
//  PhotosPreviewCollectionViewCell.swift
//  Navigation
//
//  Created by apple on 23.04.2022.
//

import UIKit

class PhotosPreviewCollectionViewCell: UICollectionViewCell {
    
    private var photo: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     func setupSell(_ photos: Photos) {
        photo.image = photos.image
    }
    private func layout() {
        contentView.layer.cornerRadius = 6
        contentView.clipsToBounds = true
        contentView.addSubview(photo)
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

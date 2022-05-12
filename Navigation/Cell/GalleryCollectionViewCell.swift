//
//  GalleryCollectionViewCell.swift
//  Navigation
//
//  Created by apple on 24.04.2022.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    private let image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .green
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setGallery(_ photo: Photos) {
        image.image = photo.image
    }
    
    private func layout() {
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

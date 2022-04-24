//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by apple on 22.04.2022.
//

import UIKit
protocol PhotosTableViewCellDelegate: AnyObject {
    func pressedButton()
}
class PhotosTableViewCell: UITableViewCell {
    
    weak var delegate: PhotosTableViewCellDelegate?
    
    private var photo = Photos.makePhotoForGallary()

    private lazy var photosLabel: UILabel = {
        $0.frame = self.bounds
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
        $0.text = "Photos"
        return $0
    }(UILabel())

    private lazy var button: UIButton = {
        $0.frame = self.bounds
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        $0.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    @objc private func tapAction() {
        delegate?.pressedButton()        
    }
    
    private lazy var photosCollectView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosPreviewCollectionViewCell.self, forCellWithReuseIdentifier: PhotosPreviewCollectionViewCell.identifire)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let inset: CGFloat = 12
    
    private func layout() {
        
        [photosLabel, button, photosCollectView].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  inset),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset)
        ])

        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            button.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            photosCollectView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
            photosCollectView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            photosCollectView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            photosCollectView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }
}

// MARK: UICollectionViewDataSource

extension PhotosTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosPreviewCollectionViewCell.identifire, for: indexPath) as! PhotosPreviewCollectionViewCell
        cell.setupSell(photo[indexPath.item])
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 8 * 3) / 4
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.pressedButton()
    }
    
}

//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by apple on 22.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private var photosLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
        $0.text = "Photos"
        
        $0.backgroundColor = .yellow
        return $0
    }(UILabel())
    
    private var button: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        
        $0.backgroundColor = .green
        return $0
    }(UIButton())
    
    private var viewForCollection: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        return $0
    }(UIView())
    
//    private lazy var photosCollectView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.backgroundColor = .red
//
//        return collectionView
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        
        let inset: CGFloat = 12
        
        [photosLabel, button, viewForCollection].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  inset),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset)
        ])
        
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            button.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            viewForCollection.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
            viewForCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            viewForCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            viewForCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
        
    }
    

  

}

// MARK: UICollectionViewDataSource

//extension PhotosTableViewCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        UICollectionViewCell()
//    }
//
//
//}
//
//// MARK: UICollectionViewDelegateFlowLayout
//
//extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
//
//}

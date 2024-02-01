//
//  CollectionViewCell.swift
//  Insta
//
//  Created by A on 2024/01/31.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    let cellImage: UIImageView = {
        let cellImage = UIImageView()
        cellImage.contentMode = .scaleAspectFill
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        return cellImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cellImage)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            cellImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellImage.topAnchor.constraint(equalTo: topAnchor),
            cellImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

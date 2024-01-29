//
//  VideoCell.swift
//  Player
//
//  Created by A on 2024/01/29.
//

import Foundation
import UIKit

class VideoCell: UITableViewCell {
    override func prepareForReuse() {
        titleImage.image = nil
        titleLabel.text = nil
    }
    
    let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    let titleImage: UIImageView = {
        let titleImage = UIImageView()
        titleImage.contentMode = .scaleAspectFit
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        return titleImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        stackView.addArrangedSubview(titleImage)
        stackView.addArrangedSubview(titleLabel)
        addSubview(stackView)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setThumbnail(imageURL: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.titleImage.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self?.titleImage.tintColor = .lightGray
                    self?.titleImage.image = UIImage(systemName: "play.rectangle.fill")
                }
            }
        }
    }
    
    func setTitle(title: String) {
        self.titleLabel.text = title
    }
    
    
    func setLayout() {
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        titleImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
    }
}

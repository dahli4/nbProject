//
//  ProfileDesignViewController.swift
//  Insta
//
//  Created by A on 2024/01/29.
//

import Foundation
import UIKit
import SwiftUI

#Preview{
    ProfileDesignViewController()
}

class ProfileDesignViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let tabBar = TabBarController()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.cellImage.image = UIImage(named: "picture \(indexPath.item + 1)")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.bounds.width - 4) / 3
        let cellHeight = cellWidth
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUi()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    let userFollowInfo: UIStackView = {
        let userFollowInfo = UIStackView()
        userFollowInfo.translatesAutoresizingMaskIntoConstraints = false
        userFollowInfo.axis = .horizontal
        userFollowInfo.distribution = .equalCentering
        userFollowInfo.alignment = .center
        return userFollowInfo
    }()
    
    let postStack: UIStackView = {
        let postStack = UIStackView()
        postStack.translatesAutoresizingMaskIntoConstraints = false
        postStack.axis = .vertical
        return postStack
    }()
    
    let followerStack: UIStackView = {
        let followerStack = UIStackView()
        followerStack.translatesAutoresizingMaskIntoConstraints = false
        followerStack.axis = .vertical
        return followerStack
    }()
    
    let followingStack: UIStackView = {
        let followingStack = UIStackView()
        followingStack.translatesAutoresizingMaskIntoConstraints = false
        followingStack.axis = .vertical
        return followingStack
    }()
    
    let postLabel: UILabel = {
        let postLabel = UILabel()
        postLabel.textAlignment = .center
        postLabel.font = UIFont.boldSystemFont(ofSize: 16.5)
        postLabel.text = "7"
        return postLabel
    }()
    
    let postNameLabel: UILabel = {
        let postNameLabel = UILabel()
        postNameLabel.font = UIFont.systemFont(ofSize: 14)
        postNameLabel.textAlignment = .center
        postNameLabel.text = "Post"
        return postNameLabel
    }()
    
    let followerLabel: UILabel = {
        let followerLabel = UILabel()
        followerLabel.textAlignment = .center
        followerLabel.font = UIFont.boldSystemFont(ofSize: 16.5)
        followerLabel.text = "0"
        return followerLabel
    }()
    
    let followerNameLabel: UILabel = {
        let followerNameLabel = UILabel()
        followerNameLabel.font = UIFont.systemFont(ofSize: 14)
        followerNameLabel.textAlignment = .center
        followerNameLabel.text = "Follower"
        return followerNameLabel
    }()
    
    let followingLabel: UILabel = {
        let followingLabel = UILabel()
        followingLabel.textAlignment = .center
        followingLabel.font = UIFont.boldSystemFont(ofSize: 16.5)
        followingLabel.text = "0"
        return followingLabel
    }()
    
    let followingNameLabel: UILabel = {
        let followingNameLabel = UILabel()
        followingNameLabel.font = UIFont.systemFont(ofSize: 14)
        followingNameLabel.textAlignment = .center
        followingNameLabel.text = "Following"
        return followingNameLabel
    }()
    
    let userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        userNameLabel.textAlignment = .center
        userNameLabel.text = "nabaecamp"
        return userNameLabel
    }()
    
    let menuImage: UIImageView = {
        let menuImage = UIImageView()
        menuImage.translatesAutoresizingMaskIntoConstraints = false
        menuImage.contentMode = .scaleAspectFit
        guard let image = UIImage(named: "Menu") else { return UIImageView() }
        menuImage.image = image
        return menuImage
    }()
    
    let spartaImage: UIImageView = {
        let spartaImage = UIImageView()
        spartaImage.translatesAutoresizingMaskIntoConstraints = false
        spartaImage.contentMode = .scaleAspectFit
        guard let image = UIImage(named: "Ellipse 1") else { return UIImageView() }
        spartaImage.image = image
        return spartaImage
    }()
    
    let userInfoStack: UIStackView = {
        let userInfoStack = UIStackView()
        userInfoStack.translatesAutoresizingMaskIntoConstraints = false
        userInfoStack.axis = .vertical
        return userInfoStack
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "르탄이"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        return nameLabel
    }()
    
    let bioLabel: UILabel = {
        let bioLabel = UILabel()
        bioLabel.text = "iOS Developer 🍎"
        bioLabel.font = UIFont.systemFont(ofSize: 14)
        return bioLabel
    }()
    
    let linkLabel: UILabel = {
        let linkLabel = UILabel()
        linkLabel.text = "sparta.com"
        linkLabel.font = UIFont.systemFont(ofSize: 14)
        return linkLabel
    }()
    
    let middleBarStack: UIStackView = {
        let middleBarStack = UIStackView()
        middleBarStack.translatesAutoresizingMaskIntoConstraints = false
        middleBarStack.axis = .horizontal
        middleBarStack.spacing = 8
        return middleBarStack
    }()
    
    let followButton: UIButton = {
        let followButton = UIButton()
        followButton.setTitle("Follow", for: .normal)
        followButton.layer.cornerRadius = 4
        followButton.layer.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1).cgColor
        return followButton
    }()
    
    let messageButton: UIButton = {
        let messageButton = UIButton()
        messageButton.setTitle("Message", for: .normal)
        messageButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        messageButton.setTitleColor(.black, for: .normal)
        messageButton.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        messageButton.layer.cornerRadius = 4
        messageButton.layer.borderWidth = 1.5
        messageButton.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        return messageButton
    }()
    
    let moreImage: UIImageView = {
        let moreImage = UIImageView()
        moreImage.translatesAutoresizingMaskIntoConstraints = false
        moreImage.contentMode = .scaleAspectFit
        guard let image = UIImage(named: "More") else { return UIImageView() }
        moreImage.image = image
        return moreImage
    }()
    
    let naviBarStack: UIStackView = {
        let naviBarStack = UIStackView()
        naviBarStack.translatesAutoresizingMaskIntoConstraints = false
        naviBarStack.axis = .vertical
        naviBarStack.spacing = 8
        return naviBarStack
    }()
    
    let divideImage: UIImageView = {
        let divideImage = UIImageView()
        divideImage.translatesAutoresizingMaskIntoConstraints = false
        divideImage.contentMode = .scaleAspectFit
        divideImage.layer.borderWidth = 0.5
        divideImage.layer.borderColor = UIColor(red: 0.859, green: 0.859, blue: 0.859, alpha: 1).cgColor
        
        guard let image = UIImage(named: "Divider") else { return UIImageView() }
        divideImage.image = image
        return divideImage
    }()
    
    let gridImage: UIImageView = {
        let gridImage = UIImageView()
        gridImage.translatesAutoresizingMaskIntoConstraints = false
        gridImage.contentMode = .scaleAspectFit
        guard let image = UIImage(named: "Grid") else { return UIImageView() }
        gridImage.image = image
        return gridImage
    }()
    
    let sectionImage: UIImageView = {
        let sectionImage = UIImageView()
        sectionImage.translatesAutoresizingMaskIntoConstraints = false
        sectionImage.contentMode = .scaleAspectFit
        guard let image = UIImage(named: "Section indicator") else { return UIImageView() }
        sectionImage.image = image
        return sectionImage
    }()
    
    let profilImage: UIImageView = {
        let profilImage = UIImageView()
        profilImage.translatesAutoresizingMaskIntoConstraints = false
        profilImage.frame = CGRect(x: 0, y: 0, width: 22.5, height: 22.75)
        profilImage.contentMode = .scaleAspectFit
        guard let image = UIImage(named: "Profile - Fill") else { return UIImageView() }
        profilImage.image = image
        return profilImage
    }()
    
    func setStack() {
        view.addSubview(userFollowInfo)
        view.addSubview(userInfoStack)
        view.addSubview(middleBarStack)
        view.addSubview(naviBarStack)
        
        for element in [divideImage, gridImage, sectionImage] {
            naviBarStack.addArrangedSubview(element)
        }
        
        for element in [followButton, messageButton, moreImage] {
            middleBarStack.addArrangedSubview(element)
        }
        
        for element in [nameLabel, bioLabel, linkLabel] {
            userInfoStack.addArrangedSubview(element)
        }
        
        for element in [postStack, followerStack, followingStack] {
            userFollowInfo.addArrangedSubview(element)
        }
        
        for element in [postLabel, postNameLabel] {
            postStack.addArrangedSubview(element)
        }
        
        for element in [followerLabel, followerNameLabel] {
            followerStack.addArrangedSubview(element)
        }
        
        for element in [followingLabel, followingNameLabel] {
            followingStack.addArrangedSubview(element)
        }
    }
    
    func setUi() {
        view.addSubview(userNameLabel)
        view.addSubview(menuImage)
        view.addSubview(spartaImage)
        view.addSubview(divideImage)
        view.addSubview(collectionView)
        setStack()
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 139).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 54).isActive = true
        
        userFollowInfo.widthAnchor.constraint(equalToConstant: 224).isActive = true
        userFollowInfo.heightAnchor.constraint(equalToConstant: 41).isActive = true
        userFollowInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 143).isActive = true
        userFollowInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 116).isActive = true
        
        menuImage.widthAnchor.constraint(equalToConstant: 41).isActive = true
        menuImage.heightAnchor.constraint(equalToConstant: 17.5).isActive = true
        menuImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 338).isActive = true
        menuImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 58).isActive = true
        
        spartaImage.widthAnchor.constraint(equalToConstant: 88).isActive = true
        spartaImage.heightAnchor.constraint(equalToConstant: 88).isActive = true
        spartaImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14).isActive = true
        spartaImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 93).isActive = true
        
        userInfoStack.widthAnchor.constraint(equalToConstant: 365).isActive = true
        userInfoStack.heightAnchor.constraint(equalToConstant: 59).isActive = true
        userInfoStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        userInfoStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 195).isActive = true
        
        middleBarStack.widthAnchor.constraint(equalToConstant: 365).isActive = true
        middleBarStack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        middleBarStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        middleBarStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 265).isActive = true
        
        naviBarStack.widthAnchor.constraint(equalToConstant: 395).isActive = true
        naviBarStack.heightAnchor.constraint(equalToConstant: 44).isActive = true
        naviBarStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        naviBarStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 305).isActive = true
        
        collectionView.widthAnchor.constraint(equalToConstant: 395).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 380).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 348).isActive = true
        
    }
}

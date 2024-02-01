//
//  ViewController.swift
//  Insta
//
//  Created by A on 2024/01/29.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUi()
    }
    
    lazy var goButton: UIButton = {
        let goButton = UIButton(type: .system)
        goButton.addTarget(self, action: #selector(goButtonTapped), for: .touchUpInside)
        goButton.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: "Ellipse 1") {
            goButton.setBackgroundImage(image, for: .normal)
        }
        return goButton
    }()
    
    func setUi(){
        view.addSubview(goButton)
        
        NSLayoutConstraint.activate([
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func goButtonTapped() {
        let profileDesignViewController = ProfileDesignViewController()
        present(profileDesignViewController, animated: true, completion: nil)
    }
}


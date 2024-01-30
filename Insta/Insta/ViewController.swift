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
        goButton.setTitle("ProfileDesignViewController", for: .normal)
        goButton.addTarget(self, action: #selector(goButtonTapped), for: .touchUpInside)
        goButton.translatesAutoresizingMaskIntoConstraints = false
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


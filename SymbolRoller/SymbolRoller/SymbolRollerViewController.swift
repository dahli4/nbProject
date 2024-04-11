//
//  SymbolRollerViewController.swift
//  SymbolRoller
//
//  Created by Dahlia on 4/11/24.
//

import UIKit

class SymbolRollerViewController: UIViewController {
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()
    }
    
    @IBAction func tapButton(_ sender: Any) {
        reload()
    }
    
    func reload() {
        let symbol = symbols.randomElement()!
        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
        button.layer.cornerRadius = 30
    }
}

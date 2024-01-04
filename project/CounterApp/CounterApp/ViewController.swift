//
//  ViewController.swift
//  CounterApp
//
//  Created by A on 2023/12/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    private var count:Int = 0
    
    @IBAction func tappedUpButton(_ sender: Any) {
        self.count += 1
        self.refreshLabel()
    }
    @IBAction func tappedDownButton(_ sender: Any) {
        self.count -= 1
        self.refreshLabel()
    }
    func refreshLabel(){
        self.countLabel.text = String(self.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshLabel()
        // Do any additional setup after loading the view.
    }


}


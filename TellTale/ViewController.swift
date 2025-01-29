//
//  ViewController.swift
//  TellTale
//
//  Created by Reina Nakade on 2025/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var Maintitle: UILabel!
    @IBOutlet var MainStartButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPeople" {
            let PeopleViewController = segue.destination as! PeopleViewController        }
    }
    
    
    
}


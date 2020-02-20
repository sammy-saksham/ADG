//
//  ViewController.swift
//  Light
//
//  Created by Saksham Jain on 20/02/20.
//  Copyright © 2020 Saksham Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func updateUI(){
        view.backgroundColor = lightOn ? .white: .black
        /*if lightOn{
            view.backgroundColor = .white
            //lightButton.setTitle("off", for: .normal)
        }else{
            view.backgroundColor = .black
            //lightButton.setTitle("on", for: .normal)
        }*/
    }
    
    var lightOn=true
    @IBAction func buttonPressed(_ sender: AnyObject) {
        lightOn = !lightOn
        
        updateUI()
        
    }
    //@IBOutlet weak var lightButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        updateUI()
        // Do any additional setup after loading the view.
    }


}


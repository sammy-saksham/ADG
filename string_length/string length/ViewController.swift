//
//  ViewController.swift
//  string length
//
//  Created by Saksham Jain on 08/02/20.
//  Copyright © 2020 Saksham Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func longstr(str1: String, str2: String){
        let i=str1.count
        let j=str2.count
        
        if i>j{
            print(str1)
        }
        if j>i{
            print(str2)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        longstr(str1: "Longer string", str2: "short string")
    }


}


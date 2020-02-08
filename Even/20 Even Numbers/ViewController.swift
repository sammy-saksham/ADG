//
//  ViewController.swift
//  20 Even Numbers
//
//  Created by Saksham Jain on 08/02/20.
//  Copyright © 2020 Saksham Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func firsteven(){
        var i=1;
        for _ in 1...20{
            print(2*i)
            i+=1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firsteven()
    }


}


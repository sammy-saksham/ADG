//
//  ViewController.swift
//  string array
//
//  Created by Saksham Jain on 08/02/20.
//  Copyright © 2020 Saksham Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func stringswitch(str: [String], index: Int){
        if index<str.count{
            var mystr: [String]=str
            var temp: String=str[0]
            mystr[0]=str[index-1]
            mystr[index-1]=temp
            print(mystr)
        }
        else{
            print("Invalid Index")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var list: [String]=[]
        list.append("Saksham")
        list.append("Akshat")
        list.append("Saniya")
        list.append("Yashoda")
        list.append("Anjali")
        
        stringswitch(str: list, index: 3)
    }


}


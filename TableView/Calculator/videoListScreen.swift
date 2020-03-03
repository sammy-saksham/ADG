//
//  videoListScreen.swift
//  Calculator
//
//  Created by Saksham Jain on 26/02/20.
//  Copyright © 2020 Saksham Jain. All rights reserved.
//

import UIKit

class videoListScreen: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
}

extension videoListScreen: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cellid", for:    indexPath) as! VideoCell
        cell.videoTitleLabel.text = "Hello World"
        
        return cell
        
    }
    
    
}

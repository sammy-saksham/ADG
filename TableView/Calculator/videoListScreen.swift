//
//  Calculator.swift
//  Calculator
//
//  Created by Saksham Jain on 24/02/20.
//  Copyright © 2020 Saksham Jain. All rights reserved.
//

import UIKit

class videoListScreen: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var videos: [Video]=[]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        videos = createArray()
    }
    
    
    func createArray()->[Video] {
        
        //I couldn't download the images so this is just an arbitrary file name that I inserted//
        let video1 = Video(image: img1, title: "Your First App")
        let video2 = Video(image: img2, title: "My Dev Setup")
        let video3 = Video(image: img3, title: "iOS Interview")
        let video4 = Video(image: img4, title: "Buttons in TableViews")
        let video5 = Video(image: img5, title: "UIPickerView Tutorial")
        let video6 = Video(image: img6, title: "Day in the Life")
    
        return [video1, video2, video3, video4, video5, video6]
    }
}


extension VideoListScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return videos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell {
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        cell.setVideo(video: video)
        
        return cell
    }
}

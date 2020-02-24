//
//  VideoCell.swift
//  Calculator
//
//  Created by Saksham Jain on 24/02/20.
//  Copyright © 2020 Saksham Jain. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    func setVideo(video: Video) {
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
    }
    
}

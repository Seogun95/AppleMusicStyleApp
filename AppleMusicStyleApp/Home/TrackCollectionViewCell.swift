//
//  TrackCollectionViewCell.swift
//  AppleMusicStyleApp
//
//  Created by Seogun Kim on 2021/07/22.
//

import UIKit
import Foundation

// TrackCollectionViewCell

class TrackCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var trackTumbnail: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        trackTumbnail.layer.cornerRadius = 10
        trackTitle.textColor = UIColor.systemGray2
    }
}

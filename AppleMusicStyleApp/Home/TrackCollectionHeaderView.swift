//
//  TrackCollectionHeaderView.swift
//  AppleMusicStyleApp
//
//  Created by Seogun Kim on 2021/07/24.
//

import UIKit
import AVFoundation

class TrackCollectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var item: AVPlayerItem?
    var tapHandler: ((AVPlayerItem) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 10
    }
    
    func update(with item: AVPlayerItem) {
        // TODO: 헤더뷰 업데이트 하기
        self.item = item
        guard let track = item.convertToTrack() else { return }
        
        self.thumbnailImageView.image = track.artwork
        self.descriptionLabel.text = "오늘의 추천 곡 - \(track.artist)의 \(track.albumName)"
    }
    
    @IBAction func cardTapped(_ sender: UIButton) {
        // TODO: 탭했을때 처리
        guard let todaysItem = item else { return }
        tapHandler?(todaysItem)
    }
}

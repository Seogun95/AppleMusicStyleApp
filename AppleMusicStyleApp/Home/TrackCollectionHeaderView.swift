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
    }
    
    @IBAction func cardTapped(_ sender: UIButton) {
        // TODO: 탭했을때 처리
    }
}
//
//  Track.swift
//  AppleMusicStyleApp
//
//  Created by Seogun Kim on 2021/07/22.
//

import UIKit

/*
 Track - 아티스트, 타이틀, 앨범이름, 썸네일
 Album - 아티스트, 타이틀, 트랙, 썸네일
 */

// 아래 있는 Track을 TrackManager에서 사용하면 됨.

struct Track {
    let title: String
    let artist: String
    let albumName: String
    let artwork: UIImage
    
    init(title: String, artist: String, albumName: String, artwork: UIImage) {
        self.title = title
        self.artist = artist
        self.albumName = albumName
        self.artwork = artwork
    }
}

struct Album {
    let title: String
    let tracks: [Track]
    var thumbnail: UIImage? {
        return tracks.first?.artwork
    }
    
    var artist: String? {
        return tracks.first?.artist
    }
    
    init(title: String, tracks: [Track]) {
        self.title = title
        self.tracks = tracks
    }
}

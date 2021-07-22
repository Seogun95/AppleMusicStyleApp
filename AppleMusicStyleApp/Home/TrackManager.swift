//
//  TrackManager.swift
//  AppleMusicStyleApp
//
//  Created by Seogun Kim on 2021/07/22.
//

import UIKit
import AVFoundation   // 미디어 관련에 공구함 이라고 생각하면 됨

class TrackManager {
    // TODO: 프로퍼티 정의하기 - 1. Track, 2. Album, 3. 오늘의 곡
    // 1. 곡들을 로딩해야함. 로딩한 곡들을 셋팅
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    var todayTrack: AVPlayerItem?
    
    // TODO: 생성자 정의
    init() {
        
    }
    
    // 2. TODO: 트랙 로드
    func loadTracks() -> [AVPlayerItem] {
        return []
    }
    
    // 3. TODO: 로딩된 곡을 인덱스에 맞는 트랙 로드
    func track(at index: Int) -> Track? {
        return nil
    }
    
    // 4. TODO: 앨범 로딩메소드 구현부
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        return []
    }
    
    // 5. TODO: 오늘의 트랙 랜덤으로 선택
    func loadOtherTodaysTrack() {
        
    }
}

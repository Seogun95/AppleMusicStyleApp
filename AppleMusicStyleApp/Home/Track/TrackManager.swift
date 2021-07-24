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
        // 트랙을 로딩해야 함
        let tracks = loadTracks()
        // 트랙을 업데이트 함
        self.tracks = tracks
        // 앨범을 추출해주는 메소드를 생성
        self.albums = loadAlbums(tracks: tracks)
        // 오늘의 트랙 -  var tracks가 a rray인데 이 array에서 랜덤값을 설정해주는것이 randomElement
        self.todayTrack = self.tracks.randomElement()
    }
    
    // 2. TODO: 트랙 로드 - 파일들을 AVPlayer 객체로 가져온다고 생각하면 됨
    func loadTracks() -> [AVPlayerItem] {
        
        //파일을 읽어서 AVPlayerItem 만듦
        let urls = Bundle.main.urls(forResourcesWithExtension: ".mp3", subdirectory: nil) ?? []
        
   /* ===== 클로저를 이용한 함수 map 활용 ( 첫 번째 방법 ) ===== */
/*
//        var items: [AVPlayerItem] = []
//        for url in urls {
//            let item = AVPlayerItem(url: url)
//            items.append(item)
//        }
        
   /* ===== 클로저를 이용한 함수 map 활용 ( 두 번째 방법 ) ===== */
        
//        let items = urls.map { AVPlayerItem(url: $0) }
//        return items
*/
        
   /* ===== 클로저를 이용한 함수 map 활용 ( 세 번째 방법 (추천)) ===== */
        let items = urls.map { url in
          return AVPlayerItem(url: url)
        }
        return items
    }
     
    // 3. TODO: 로딩된 곡을 인덱스에 맞는 트랙 로드
    func track(at index: Int) -> Track? {
        let playerItem = tracks[index]
        let track = playerItem.convertToTrack()
        return track
    }
    
    // 4. TODO: 앨범 로딩메소드 구현부
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        let trackList: [Track] = tracks.compactMap { $0.convertToTrack()}
        let albumDics = Dictionary(grouping: trackList, by: { (track) in track.albumName })
        var albums: [Album] = []
        for (key, value) in albumDics {
            let title = key
            let tracks = value
            let album = Album(title: title, tracks: tracks)
            albums.append(album)
        }
        return albums
    }
    
    // 5. TODO: 오늘의 트랙 랜덤으로 선택
    func loadOtherTodaysTrack() {
        self.todayTrack = self.tracks.randomElement()
    }
}

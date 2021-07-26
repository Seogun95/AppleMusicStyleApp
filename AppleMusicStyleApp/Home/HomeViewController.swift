//
//  HomeViewController.swift
//  AppleMusicStyleApp
//
//  Created by Seogun Kim on 2021/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let trackManager: TrackManager = TrackManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    // 몇개 표시 할까
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // TODO: TrackManager에서 트랙갯수 가져와야함
        return trackManager.tracks.count
    }
    
    // 셀을 어떻게 표시 할까
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: 셀 구성하기
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollectionViewCell", for: indexPath) as? TrackCollectionViewCell else {
            return UICollectionViewCell()
        }
        let track = trackManager.track(at: indexPath.item)
        cell.updateUI(item: track)
        return cell
    }
    
    // 헤더뷰 표시
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let item = trackManager.todayTrack else {
                return UICollectionReusableView()
            }
            // 커스텀 헤더뷰 가져오기
            
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TrackCollectionHeaderView", for: indexPath) as? TrackCollectionHeaderView else {
                return UICollectionReusableView()
            }
            header.update(with: item)
            header.tapHandler = { item -> Void in
                print("----> Item title : \(item.convertToTrack()?.title)")
            }
            
            // TODO: 헤더 구성하기
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    // 클릭했을때 어떻게 할까
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: 곡 클릭시 플레이뷰 띄움
        performSegue(withIdentifier: "", sender: nil)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    // 셀 사이즈 자동 조절
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: 셀 사이즈 구하기 (상하좌우 마진 20)
        let itemSpacing: CGFloat = 20
        let margin: CGFloat = 20
        let width = (collectionView.bounds.width - itemSpacing - margin * 2)/2
        let height = width + 60
        
        return CGSize(width: width, height: height)
    }
}

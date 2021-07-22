//
//  HomeViewController.swift
//  AppleMusicStyleApp
//
//  Created by Seogun Kim on 2021/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    // 몇개 표시 할까
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // TODO: TrackManager에서 트랙갯수 가져와야함
        return 10
    }
    
    // 셀을 어떻게 표시 할까
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollectionViewCell", for: indexPath) as? TrackCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    // 헤더뷰 표시
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            // TODO: 헤더 구성하기
            return UICollectionReusableView()
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

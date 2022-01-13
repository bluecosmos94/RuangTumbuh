//
//  LastPageViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 15/11/21.
//

import UIKit

class LastPageViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var lastBoardingSlide = OnBoardingSlide.lastSlide
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
  
    @IBAction func toMostLastPage(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MostLastViewController") as! MostLastViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}


extension LastPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    static var lastPageIdentifier = "LastPageCollectionViewCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lastBoardingSlide.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.lastPageIdentifier, for: indexPath) as? LastPageCollectionViewCell else {
            fatalError("cannot get cell")
        }
        let slides = lastBoardingSlide[indexPath.row]
        cell.configure(slideLabel: slides.label, slideDesc: slides.desc, slideNum: slides.image)
        collectionView.reloadItems(at: [indexPath])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    
}

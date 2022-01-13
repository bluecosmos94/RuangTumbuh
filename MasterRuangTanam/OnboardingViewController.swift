//
//  OnboardingViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 15/11/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var buttonNextPage: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    
    var onBoardingSlide = OnBoardingSlide.dataSlide
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == 1{
                buttonNextPage.setTitle("Ayo Bertanam", for: .normal)
//                print(currentPage, "curreng page akhir")
               
            } else if currentPage == 0{
                buttonNextPage.setTitle("Oke", for: .normal)
//                print(currentPage, "woyo")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nib = UINib(nibName: "LastOnboardCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "lastOnboard")
    }
    
   
    @IBAction func buttonNextSlide(_ sender: Any) {
        if currentPage == onBoardingSlide.count - 1 {
            UserDefaultService.shared.passOnboarding()
            let dahboard = DashboardController(nibName: "DashboardController", bundle: nil)
            
            let navigationController  = UINavigationController(rootViewController: dahboard)
            DissolveAnimation(view: self.view.window ?? UIWindow())
            self.view.window?.rootViewController = navigationController
            
        }
        else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
      
    }
    
}

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    static let onBoardingIdentifier = "OnBoardingCollectionViewCell"

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoardingSlide.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.row,onBoardingSlide.count)
//        if indexPath.row  == onBoardingSlide.count - 1{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "lastOnboard", for: indexPath)
//            return cell
//        }else
        
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.onBoardingIdentifier, for: indexPath) as? OnboardingCollectionViewCell else {
                fatalError("cannot get cell")
            }
            
            let slides = onBoardingSlide[indexPath.row]
            cell.configure(label: slides.label, description: slides.description, image: slides.image)
            collectionView.reloadItems(at: [indexPath])
            return cell
        
        
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)

    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}


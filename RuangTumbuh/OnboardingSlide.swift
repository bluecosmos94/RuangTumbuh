//
//  OnboardingSlide.swift
//  Master Ruang Tanam
//
//  Created by angga saputra on 11/11/21.
//

import UIKit

struct OnBoardingSlide {
    let label, description: String
    let image: UIImage
}

struct LastBoardingSlide {
    let label, desc: String
    let image: UIImage
}
extension OnBoardingSlide {
    static var dataSlide = [
        OnBoardingSlide(label: "Tak perlu lahan besar untuk memulai.", description: "Manfaatkan lahan yang ada untuk menumbuhkan makananmu", image: UIImage(named: "dashboard1")!),
        OnBoardingSlide(label: "Rencanakan dengan Mudah", description: "Coba langkah mudah dari kami untuk membuat rencana bertanam di tempatmu!", image: UIImage(named: "dashboard2")!),
    ]
    
    static var lastSlide = [
        LastBoardingSlide(label: "lorem ipsum dolor sir", desc: "lorem ipsum dolor sir amit amit deh", image: UIImage(named: "one")!),
        LastBoardingSlide(label: "lorem ipsum dolor sir", desc: "lorem ipsum dolor sir amit amit deh", image: UIImage(named: "two")!),
        LastBoardingSlide(label: "lorem ipsum dolor sir", desc: "lorem ipsum dolor sir amit amit deh", image: UIImage(named: "three")!),
    ]
}

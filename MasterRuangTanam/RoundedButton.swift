//
//  RoundedButton.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 15/11/21.
//

import UIKit


import UIKit

@IBDesignable class RoundButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadiusView)
    }
    
    func refreshCorners(value: CGFloat) {
        self.layer.cornerRadius = value
        if self.titleLabel?.text == " "{
            self.titleLabel?.text = ""
        }
        
    }
    
    @IBInspectable var cornerRadiusView: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadiusView)
        }
    }
    
}

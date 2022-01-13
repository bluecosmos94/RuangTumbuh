//
//  RoundedButton.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 15/11/21.
//


import UIKit

@IBDesignable class RoundView: UIView {
    
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
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = .init(width: 2, height: 3.0)
        self.layer.shadowRadius = 3
    }
    
    
    
    @IBInspectable var cornerRadiusView: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadiusView)
        }
    }
    
}


@IBDesignable class RoundImageView: UIImageView {
    
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

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
    
    
    
    @IBInspectable var cornerRadiusView: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadiusView)
        }
    }
    
}

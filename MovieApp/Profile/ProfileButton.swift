//
//  ProfileButton.swift
//  MovieApp
//
//  Created by axel on 05/12/2018.
//  Copyright © 2018 axel. All rights reserved.
//

import UIKit

@IBDesignable
class ProfileButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.backgroundColor = UIColor(white: 1, alpha: 1).cgColor
        //self.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 5
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }
    
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 3.0
    }
    
    func removeShadow(){
        self.layer.shadowOpacity = 0
    }
    

}

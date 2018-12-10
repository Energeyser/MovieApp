//
//  ProfilePicture.swift
//  MovieApp
//
//  Created by axel on 05/12/2018.
//  Copyright © 2018 axel. All rights reserved.
//

import UIKit

@IBDesignable
class ProfilePicture: UIImageView {
    
   

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 50
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 3.0
    }
    
    

}

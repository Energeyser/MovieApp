//
//  NextButton.swift
//  MovieApp
//
//  Created by axel on 05/12/2018.
//  Copyright © 2018 axel. All rights reserved.
//

import UIKit

@IBDesignable
class NextButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 20
    }
    
    

}

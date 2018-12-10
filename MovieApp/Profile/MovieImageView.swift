//
//  movieImage.swift
//  MovieApp
//
//  Created by axel on 06/12/2018.
//  Copyright © 2018 axel. All rights reserved.
//

import UIKit

class MovieImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 50
    }

}

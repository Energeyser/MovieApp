//
//  CollectionViewCell.swift
//  MovieApp
//
//  Created by axel on 06/12/2018.
//  Copyright © 2018 axel. All rights reserved.
//

import UIKit

class CollectionViewNowCell: UICollectionViewCell {
    
    
    @IBOutlet weak var nowImage: UIImageView!
    @IBOutlet weak var nowLabel: UILabel!
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //nowImage.layer.cornerRadius = 10
        self.layer.cornerRadius = 10
    }
    
}

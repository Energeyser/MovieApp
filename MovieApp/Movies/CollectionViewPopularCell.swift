//
//  CollectionViewPopularCell.swift
//  MovieApp
//
//  Created by axel on 06/12/2018.
//  Copyright © 2018 axel. All rights reserved.
//

import UIKit

class CollectionViewPopularCell: UICollectionViewCell {
    
    
    @IBOutlet weak var popularImage: UIImageView!
    @IBOutlet weak var popularNote: UILabel!
    @IBOutlet weak var popularDate: UILabel!
    @IBOutlet weak var popularTitle: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
    }
}

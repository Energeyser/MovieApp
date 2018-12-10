//
//  CollectionViewPlaylistCell.swift
//  MovieApp
//
//  Created by axel on 06/12/2018.
//  Copyright © 2018 axel. All rights reserved.
//

import UIKit

class CollectionViewPlaylistCell: UICollectionViewCell {
    
    @IBOutlet weak var playlistImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
    }
    
}

//
//  CollectionViewPlaylistCell.swift
//  MovieApp
//
//  Created by axel on 06/12/2018.
//  Copyright © 2018 axel. All rights reserved.
//

import UIKit

class CollectionViewPlaylistCell: UICollectionViewCell {
    
    @IBOutlet weak var playlistImageBlur: UIImageView!
    @IBOutlet weak var playlistImage: UIImageView!
    @IBOutlet weak var playlistBlur: UIVisualEffectView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playlistImage.layer.cornerRadius = 10
        playlistImageBlur.layer.cornerRadius = 10
        self.layer.cornerRadius = 10
    }
    
}

//
//  ProfileViewController.swift
//  MovieApp
//
//  Created by axel on 05/12/2018.
//  Copyright © 2018 axel. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var wantButton: ProfileButton!
    @IBOutlet weak var watchedButton: ProfileButton!
    @IBOutlet weak var watchedLabel: UILabel!
    @IBOutlet weak var wantLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let movies = ["Arrival","The Dark Knight","A Ghost Story","Wonder Woman","Flash","Iron Man","Rampage"]
    let movieImages: [UIImage] = [
        UIImage(named: "arrival")!,
        UIImage(named: "the dark knight")!,
        UIImage(named: "a ghost story")!,
        UIImage(named: "wonder woman")!,
        UIImage(named: "flash")!,
        UIImage(named: "iron man")!,
        UIImage(named: "rampage")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3 )
        layout.minimumInteritemSpacing = 3
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20)/4, height: 120)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! CollectionViewMovieCell
        
        cell.movieImage.image = movieImages[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    @IBAction func onWatched(_ sender: Any) {
        wantLabel.textColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        watchedLabel.textColor = UIColor(red: 215/255, green: 47/255, blue: 46/255, alpha: 1)
        watchedButton.addShadow()
        wantButton.removeShadow()
    }
    
    @IBAction func onWant(_ sender: Any) {
        
        wantLabel.textColor = UIColor(red: 215/255, green: 47/255, blue: 46/255, alpha: 1)
        watchedLabel.textColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        watchedButton.removeShadow()
        wantButton.addShadow()
        
    }
    

    

}

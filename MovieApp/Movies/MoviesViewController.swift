//
//  MoviesViewController.swift
//  MovieApp
//
//  Created by axel on 06/12/2018.
//  Copyright © 2018 axel. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    let playlistImages: [UIImage] = [
        UIImage(named: "mao trailer")!,
        UIImage(named: "truc chinois")!,
        UIImage(named: "other playlist")!,
    ]
    
    let nowImages: [UIImage] = [
    UIImage(named: "arrival")!,
    UIImage(named: "the dark knight")!,
    UIImage(named: "a ghost story")!,
    UIImage(named: "wonder woman")!,
    ]
    
    let nowLabels = ["Arrival","The Dark Knight","A Ghost Story", "Wonder Woman"]
    
    let popularImages: [UIImage] = [
        UIImage(named: "arrival")!,
        UIImage(named: "the dark knight")!,
        UIImage(named: "a ghost story")!,
        UIImage(named: "wonder woman")!,
        UIImage(named: "flash")!,
        UIImage(named: "iron man")!,
        UIImage(named: "rampage")!
    ]
    
    let popularTitles = ["Arrival","The Dark Knight","A Ghost Story","Wonder Woman","Flash","Iron Man","Rampage"]
    let popularDates = ["2018","2016","2015", "2018"]
    let popularNotes = ["7.5","9.5","6", "5.5"]
    
    
    
    @IBOutlet weak var playlistCollectionView: UICollectionView!
    @IBOutlet weak var nowCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        playlistCollectionView.dataSource = self
        playlistCollectionView.delegate = self
        
        nowCollectionView.dataSource = self
        nowCollectionView.delegate = self
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        
        
        
        let layoutPlaylist = self.playlistCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layoutPlaylist.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5 )
        layoutPlaylist.minimumInteritemSpacing = 5
        layoutPlaylist.itemSize = CGSize(width: (self.playlistCollectionView.frame.size.width - 20), height: (self.nowCollectionView.frame.size.height))
        
        let layoutNow = self.nowCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layoutNow.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5 )
        layoutNow.minimumInteritemSpacing = 5
        layoutNow.itemSize = CGSize(width: (self.nowCollectionView.frame.size.width / 3 ) - 20, height: (self.nowCollectionView.frame.size.height))
        
        let layoutPopular = self.popularCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layoutPopular.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5 )
        layoutPopular.minimumInteritemSpacing = 3
        layoutPopular.itemSize = CGSize(width: (self.nowCollectionView.frame.size.width / 3 ) - 20, height: (self.nowCollectionView.frame.size.height) - 50)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         if collectionView == self.playlistCollectionView {
            return playlistImages.count
        }
         else  if collectionView == self.nowCollectionView{
            return nowImages.count
        }
         else{
            return popularImages.count
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.playlistCollectionView {
            let playlistCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaylistMovieCell", for: indexPath) as! CollectionViewPlaylistCell
            
            playlistCell.playlistImage.image = playlistImages[indexPath.item]
            
            return playlistCell
        }
            
        else if collectionView == self.nowCollectionView{
            let nowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowMovieCell", for: indexPath) as! CollectionViewNowCell
            
            nowCell.nowImage.image = nowImages[indexPath.item]
            nowCell.nowLabel.text = nowLabels[indexPath.item].uppercased()
            
            return nowCell
        }
        else{
            let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularMovieCell", for: indexPath) as! CollectionViewPopularCell
            
            popularCell.popularImage.image = popularImages[indexPath.item]
            popularCell.popularNote.text = String(Int.random(in: 0 ..< 10))
            popularCell.popularDate.text = String(Int.random(in: 2010 ..< 2018))
            popularCell.popularTitle.text = popularTitles[indexPath.item].uppercased()
            
            return popularCell
            
        }
        
        // TODO : ajouter les autres collections
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          if collectionView == self.playlistCollectionView {
            //TODO : action au tap
                print(indexPath.item)
            }
        }
}

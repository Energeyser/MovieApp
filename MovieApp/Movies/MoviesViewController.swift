//
//  MoviesViewController.swift
//  MovieApp
//
//  Created by axel on 06/12/2018.
//  Copyright © 2018 axel. All rights reserved.
//

import UIKit
import Foundation

class MoviesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    
    let playlistImages: [UIImage] = [
        UIImage(named: "playlist1")!,
        UIImage(named: "the dark knight")!,
        UIImage(named: "a ghost story")!,
    ]
    
    var nowImages: [UIImage] = []
    
    let nowLabels = ["null","null","null", "null"]
    
    var popularImages: [UIImage] = []
    
    let popularTitles = ["Arrival","The Dark Knight","A Ghost Story","Wonder Woman","Flash","Iron Man","Rampage"]
    let popularDates = ["2018","2016","2015", "2018"]
    let popularNotes = ["7.5","9.5","6", "5.5"]
    let language = "fr"
    let api_key = "324976fbd6c97837393e4a3bf3cdd6a0"
    
    
    
    @IBOutlet weak var playlistCollectionView: UICollectionView!
    @IBOutlet weak var nowCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var nowCollection: UICollectionView!
    @IBOutlet weak var popularCollection: UICollectionView!
    
    var nowMovies : PagedMovies!
    var popularMovies : PagedMovies!
    
    struct PagedMovies : Codable {
        
        struct Result: Codable{
            let poster_path: String!
            let adult: Bool!
            let overview: String!
            let release_date: String!
            let genre_ids: [Int]!
            let id: Int!
            let original_title: String!
            let title: String!
            let backdrop_path: String!
            let popularity: Float!
            let vote_count: Float!
            let video: Bool!
            let vote_average: Float!
            
        }
        
        struct Dates: Codable{
            let maximum: String!
            let minimum: String!
        }
        
        let page: Int!
        let results: [Result]!
        let dates: Dates!
        let total_pages: Int!
        let total_results: Int!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        playlistCollectionView.dataSource = self
        playlistCollectionView.delegate = self
        
        nowCollectionView.dataSource = self
        nowCollectionView.delegate = self
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        
        
        initLayouts()
        getMovies(request : "now_playing?page=1?region=FR", destination: "now")
        getMovies(request : "upcoming?page=1", destination: "popular")
    
        
       
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
            playlistCell.playlistImageBlur.image = playlistImages[indexPath.item]
            
            return playlistCell
        }
            
        else if collectionView == self.nowCollectionView{
            let nowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowMovieCell", for: indexPath) as! CollectionViewNowCell

            if let movies = nowMovies{
                nowCell.nowLabel.text = movies.results[indexPath.item].title.uppercased()
                //print(nowImages.count)
                nowCell.nowImage.image = nowImages[indexPath.item]
            }
            else{
                nowCell.nowLabel.text = nowLabels[indexPath.item].uppercased()
                nowCell.nowImage.image = nowImages[indexPath.item]
            }
            
            //nowLabels[indexPath.item].uppercased()
            
            return nowCell
        }
        else{
            let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularMovieCell", for: indexPath) as! CollectionViewPopularCell

            
            if let movies = popularMovies{
                popularCell.popularImage.image = popularImages[indexPath.item]
                popularCell.popularNote.text = String(movies.results[indexPath.item].vote_average)
                popularCell.popularDate.text = String(movies.results[indexPath.item].release_date)
                popularCell.popularTitle.text = movies.results[indexPath.item].title
            }
            else{
                popularCell.popularImage.image = popularImages[indexPath.item]
                popularCell.popularNote.text = String(Int.random(in: 0 ..< 10))
                popularCell.popularDate.text = String(Int.random(in: 2010 ..< 2018))
                popularCell.popularTitle.text = popularTitles[indexPath.item].uppercased()
            }
            
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
    
    func initLayouts(){
        let layoutPlaylist = self.playlistCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layoutPlaylist.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5 )
        //layoutPlaylist.minimumInteritemSpacing = 5
        layoutPlaylist.itemSize = CGSize(width: (self.playlistCollectionView.frame.size.width - 40), height: (self.nowCollectionView.frame.size.height)-60)
        
        let layoutNow = self.nowCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layoutNow.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5 )
        layoutNow.minimumInteritemSpacing = 5
        layoutNow.itemSize = CGSize(width: (self.nowCollectionView.frame.size.width / 2.5 ) - 20, height: (self.nowCollectionView.frame.size.height))
        
        let layoutPopular = self.popularCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layoutPopular.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5 )
        layoutPopular.minimumInteritemSpacing = 3
        layoutPopular.itemSize = CGSize(width: (self.nowCollectionView.frame.size.width / 2.5 ) - 20, height: (self.nowCollectionView.frame.size.height)-90)
    }
    
    
    func getMovies(request: String,destination:String){
       
        
        
        let postData = NSData(data: "{}".data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/"+request+"+&language="+language+"&api_key="+api_key)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error ?? "Error")
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse ?? "Error")
                
                // make sure we got data
                guard let responseData = data else {
                    print("Error: did not receive data")
                    return
                }
                    
                    let decoder = JSONDecoder()
                    // TODO : Vérifier responseData avant de décoder
                
                
                if destination == "now"{
                    self.nowMovies = try! decoder.decode(PagedMovies.self, from: responseData)
                    for result in self.nowMovies.results{
                        if let url = URL(string: "https://image.tmdb.org/t/p/w185"+result.poster_path) {
                            self.downloadImage(from: url, destination: destination)
                        }
                        //print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
                    }
                }
                else if destination == "popular"{
                    self.popularMovies = try! decoder.decode(PagedMovies.self, from: responseData)
                    for result in self.popularMovies.results{
                        if let url = URL(string: "https://image.tmdb.org/t/p/w185"+result.poster_path) {
                            self.downloadImage(from: url, destination: destination)
                        }
                        //print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
                    }
                }
                else{
                    print("Destination incorrecte")
                    return
                }
                    
                    // Récupération asynchrone des images de film
                    // Stockage des images dans nowImages
                    
                    // TODO: parametre d'entrée -> nowimages
                
            }
            
            
            
        });
        
        
        dataTask.resume()
    }
    
    
    func getMoviePoster(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        
    }
    
    func downloadImage(from url: URL, destination: String) {
        print("Download Started")
        getMoviePoster(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                // TODO: verifier que il existe une image
                if destination == "now"{
                self.nowImages.insert(UIImage(data: data)!, at: self.nowImages.endIndex)
                self.nowCollection.reloadSections(IndexSet(integer: 0))
                }
                else if destination == "popular"{
                    self.popularImages.insert(UIImage(data: data)!, at: self.popularImages.endIndex)
                    self.popularCollection.reloadSections(IndexSet(integer: 0))
                }

            }
        }
    }
    
    /*func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        //contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.nowImages.insert(image, at: self.nowImages.endIndex)
                
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }*/

}

//
//  MovieDetailViewController.swift
//  DesafioM2
//
//  Created by Andre Linces on 08/02/22.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftUI

class MovieDetailViewController: UIViewController, ModelCardDetailsCallBack {
    func actionClickCardView(indexPath: IndexPath) {
        
    }
    
    let dataSource = DataSource()
  
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("passou no didload....")
    
        let baseUrl = URL(string: "https://image.tmdb.org/t/p/w400")
        //var urlFull = https://image.tmdb.org/t/p/w200/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg
        //Retrieves data JSON using alamofire api for to add objects.
        AF.request("https://api.themoviedb.org/3/movie/550?api_key=8f04577aff690de3a89bef5e5f666fe5&append_to_response=poster_path").responseJSON { response in
            if let json = response.data {
                
                let movieDetailsApi =  MovieDetailViewController.getModelApi(modelApi_list: json)
                
                var urlFull = URL(string: "https://image.tmdb.org/t/p/w500" + movieDetailsApi.poster_path)
                
                //var urlFull = URL(string: \(baseUrl) + movieDetailsApi.poster_path)
    
                print("testUrlfull... \(urlFull)")
               
                self.imageMovie.kf.setImage(with: urlFull)
                
                print("test movieDetailsApi.. \(movieDetailsApi.poster_path)")
            
                self.reloadInputViews()
            }
            
        }
        //var movieTitle = CardDetailsModelCell().labelMovieDetails
        AF.request("https://api.themoviedb.org/3/movie/550?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US").responseJSON { response in
            if let json = response.data {
                
                let originalTitle =  MovieDetailViewController.getModelApi(modelApi_list: json)
                
                let movieTitle = originalTitle.original_title
                
                let cellMovieTitle = ModelCardDetails(delegate: self, movieDetails: movieTitle)
                
                self.dataSource.data.append(cellMovieTitle)
                
                
                //var urlFull = URL(string: \(baseUrl) + movieDetailsApi.poster_path)
    
                print("testUrlfull... \(originalTitle.original_title)")
                   
            }
            
        }
        
        //recoverApi()
        setupTableView()
        tableView.reloadData()
    }
    
//    func recoverApi () {
//
//        //Retrieves data JSON using alamofire api for to add objects.
//        AF.request("https://api.themoviedb.org/3/movie/550?api_key=8f04577aff690de3a89bef5e5f666fe5&append_to_response=poster_path").responseJSON { response in
//            if let json = response.data {
//
//                let movieDetailsApi = MovieDetailViewController.getModelApi(modelApi_list: json)
//     //https://image.tmdb.org/t/p/w200/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg
//                var testImage = "https://image.tmdb.org/t/p/w200/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg"
//                self.imageMovie.image = UIImage(named: testImage)
//                //self.imageMovie.image = UIImage(named: movieDetailsApi.poster_path)
//                print("test movieDetailsApi.. \(movieDetailsApi.poster_path)")
//                //self.navigationJoke.title = (self.categorySelect)
//
//                self.reloadInputViews()
//            }
//
//        }
//
//    }
     
    static func getModelApi(modelApi_list : Data) -> ModelApi {
        
        //Parsing the data
        
        let decoder = JSONDecoder()
        let parsedData = try! decoder.decode(ModelApi.self, from: modelApi_list )
        
       return parsedData
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.imageMovie.image
    }
    
    func setupTableView () {
        print("Into function setupTable...")
        
        //let cellMovieDetails = ModelCardDetails(delegate: self, movieDetails: "teste um")
        let cellMovieDetails2 = ModelCardDetails(delegate: self, movieDetails: "Teste Dois")


        //dataSource.data.append(cellMovieDetails)

        dataSource.data.append(cellMovieDetails2)


        dataSource.initializeTableView(tableView: tableView)

        tableView.allowsSelection = false

        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

    }

}

    


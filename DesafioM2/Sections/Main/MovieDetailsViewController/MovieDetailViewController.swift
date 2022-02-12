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

class MovieDetailViewController: UIViewController, CardDetailsModelCallBack {
    func actionClickFavoriteMovie(tagFilmeFavorite: Bool) {
        
        if tagFilmeFavorite {
            self.tagFilmeFavorito = false
        }else {
            self.tagFilmeFavorito = true
        }
        
        setupTableView()
        self.tableView.reloadData()
        
    }
    
    func actionClickCardView(indexPath: IndexPath) {
        
    }
    
    var dataSource = MovieDetailDataSource()
  
    @IBOutlet weak var tableView: UITableView!
    
    
    var tagFilmeFavorito : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("passou no didload....")
        
        setupTableView()
    
    }
     
    static func getModelApi(modelApi_list : Data) -> ModelApi {
        
        //Parsing the data
        
        let decoder = JSONDecoder()
        let parsedData = try! decoder.decode(ModelApi.self, from: modelApi_list )
        
       return parsedData
    }
    
    
    func setupTableView () {
        print("Into function setupTable...")
        
        
        dataSource = MovieDetailDataSource()
        //let cellMovieDetails = ModelCardDetails(delegate: self, movieDetails: "teste um")
        //let cellMovieDetails2 = ModelCardDetails(delegate: self, movieDetails: "Teste Dois", imageHeart: "teste")


        //dataSource.data.append(cellMovieDetails)

        //dataSource.data.append(cellMovieDetails2)

        recoverApi()

        dataSource.initializeTableView(tableView: tableView)

        tableView.allowsSelection = false

        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.reloadData()

    }
    
    func recoverApi(){
        let baseUrl = URL(string: "https://image.tmdb.org/t/p/w400")
        //var urlFull = https://image.tmdb.org/t/p/w200/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg
        //Retrieves data JSON using alamofire api for to add objects.
        AF.request("https://api.themoviedb.org/3/movie/550?api_key=8f04577aff690de3a89bef5e5f666fe5&append_to_response=poster_path").responseJSON { response in
            if let json = response.data {
                
                let movieDetailsApi =  MovieDetailViewController.getModelApi(modelApi_list: json)
                
                var urlFull = URL(string: "https://image.tmdb.org/t/p/w500" + movieDetailsApi.poster_path)
                
                //var urlFull = URL(string: \(baseUrl) + movieDetailsApi.poster_path)
    
                print("testUrlfull... \(urlFull)")
               
//                self.imageMovie.kf.setImage(with: urlFull)
                
                let cellMovieImage = CardMovieImageModel(imageMovie : (urlFull ?? URL(string: "https://tm.ibxk.com.br/2021/12/02/02070127889006.jpg?ims=1120x420")!))
                
                self.dataSource.data.append(cellMovieImage)
                
                print("test movieDetailsApi.. \(movieDetailsApi.poster_path)")
            
                self.reloadInputViews()
            }
            
        }
        //var movieTitle = CardDetailsModelCell().labelMovieDetails
        AF.request("https://api.themoviedb.org/3/movie/550?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US").responseJSON { response in
            if let json = response.data {
                
                let originalTitle =  MovieDetailViewController.getModelApi(modelApi_list: json)
                
                let movieTitle = originalTitle.original_title
                
                //let imageHeart = UIImage.init(systemName: "heart" )
                
                let cellMovieTitle = CardDetailsModel(delegate: self, movieDetails: movieTitle, tagFilmeFavorito: self.tagFilmeFavorito)
                
                self.dataSource.data.append(cellMovieTitle)
                self.dataSource.data.append(cellMovieTitle)
                self.dataSource.data.append(cellMovieTitle)
                self.dataSource.data.append(cellMovieTitle)
                self.dataSource.data.append(cellMovieTitle)
                self.dataSource.data.append(cellMovieTitle)
                self.dataSource.data.append(cellMovieTitle)
                self.dataSource.data.append(cellMovieTitle)
                self.dataSource.data.append(cellMovieTitle)
                self.dataSource.data.append(cellMovieTitle)
                
                //var urlFull = URL(string: \(baseUrl) + movieDetailsApi.poster_path)
    
                print("testUrlfull... \(originalTitle.original_title)")
              
                self.tableView.reloadData()
            }
            self.tableView.reloadData()
        }
    }

}

    


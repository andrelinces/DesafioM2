//
//  MovieDetailViewController.swift
//  DesafioM2
//
//  Created by Andre Linces on 08/02/22.
//

import UIKit
import Alamofire
import SwiftUI

class MovieDetailViewController: UIViewController, CardDetailsModelCallBack, CardListMovieModelCallBack {
    
    var responseArray: NSArray = []
    
    func actionClickFavoriteMovie(tagFilmeFavorite: Bool) {
        
        if tagFilmeFavorite {
            self.tagFilmeFavorito = false
        }else {
            self.tagFilmeFavorito = true
        }
        
        setupTableView()
        self.tableView.reloadData()
        
    }
    
    func actionClickCheckMovie(tagCheckMovie: Bool) {
        print("click in screen... \(tagCheckMovie)")
        if tagCheckMovie {
            self.tagCheckMovie = false
        }else {
            self.tagCheckMovie = true
        }
        
        setupTableView()
        self.tableView.reloadData()
    }
    
    func actionClickCardView(indexPath: IndexPath) {
        
    }
    
    var dataSource = MovieDetailDataSource()
  
    @IBOutlet weak var tableView: UITableView!
    
    
    var tagFilmeFavorito : Bool = false
    var tagCheckMovie : Bool = false
    
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
    
    static func getModelListApi(modelListApi_list : Data) -> ModelListApi {

        //Parsing the data

        let decoder = JSONDecoder()
        let parsedData = try! decoder.decode(ModelListApi.self, from: modelListApi_list )

       return parsedData
    }

    func setupTableView () {
        print("Into function setupTable...")

        dataSource.data.removeAll()
   
        recoverApi()

        dataSource.initializeTableView(tableView: tableView)

        tableView.allowsSelection = false

        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.reloadData()

    }
    
    //MARK: All retrives from alamofire.
    //MARK: func retrieves movie details: poster, title, year, likes, popularity
    
    func recoverApi(){
        
        let baseUrl = URL(string: "https://image.tmdb.org/t/p/w400")
      
        //MARK: func retrieves movie Image
        AF.request("https://api.themoviedb.org/3/movie/603?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US").responseJSON { response in
            if let json = response.data {

                let movieDetailsApi =  MovieDetailViewController.getModelApi(modelApi_list: json)

                var urlFull =  ("https://image.tmdb.org/t/p/w500" + movieDetailsApi.poster_path)

                print("testUrlfull... \(urlFull)")

                let cellMovieImage = CardMovieImageModel(imageMovie: urlFull)

                self.dataSource.data.append(cellMovieImage)

                print("test movieDetailsApi.. \(movieDetailsApi.poster_path)")

                self.reloadInputViews()
            }

        }
        //MARK: func retrieves movie details: title, year, likes and popularity
        AF.request("https://api.themoviedb.org/3/movie/603?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US").responseJSON { response in
            if let json = response.data {
                
                let modelApi =  MovieDetailViewController.getModelApi(modelApi_list: json)
                
                print("originalTitle : \(modelApi.popularity)")

                var likesMovie = modelApi.vote_count
                if likesMovie >= 1000{
                    likesMovie = likesMovie / 1000
                }else{
                    likesMovie = likesMovie * 1
                }
                var popularityMovie = modelApi.popularity
                
                //Mount cell DetaisMovie...
                let cellMovieTitle = CardDetailsModel(delegate: self, movieDetails: modelApi.original_title, tagFilmeFavorito: self.tagFilmeFavorito, likes: likesMovie, popularity: popularityMovie)
//
                self.dataSource.data.append(cellMovieTitle)
               
                self.tableView.reloadData()
            }
     
        }
   
        //Function recover List JSON, g​etSimilarMovies​.
        AF.request("https://api.themoviedb.org/3/movie/555/similar?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US&page=1").responseJSON { response in
            if let json = response.data {

                let modelResults = MovieDetailViewController.getModelListApi(modelListApi_list: json)

                print("test page... \(modelResults.page)")
                print("test results \(modelResults.results[0].title)")
                
                //Check the list retrieved of the JSON results.
                for listResults in modelResults.results {
                   
                    var urlListImageFull =  ("https://image.tmdb.org/t/p/w500" + listResults.poster_path)
                 
                    //MARK: Function that compares the id of the genre with the list of the genre.
                    var generoFilme = ""
                    var countListMovieId = 0
                    for idGenero in listResults.genre_ids {
                        //Test if it is necessary to add the last comma.
                        if countListMovieId == listResults.genre_ids.count - 1 {
                            generoFilme += GlobalMethods.getGenero(idGenero: idGenero)
                            countListMovieId += 1
                        }else {
                            generoFilme += GlobalMethods.getGenero(idGenero: idGenero) + ", "
                            countListMovieId += 1
                        }
                        
                    }
                    
                    let cellListMovie = CardListMovieModel(delegate: self,  imageMovieList: urlListImageFull , listTitleMovie: listResults.title, listYear: GlobalMethods.getDataYearFromString(dateString: listResults.release_date), listGenre: generoFilme, tagCheckMovie: self.tagCheckMovie )
                    
                    
                    self.dataSource.data.append(cellListMovie)
                    
                    self.tableView.reloadData()
                }

                self.tableView.reloadData()
            }
            self.tableView.reloadData()
        }
    }

    
}

    


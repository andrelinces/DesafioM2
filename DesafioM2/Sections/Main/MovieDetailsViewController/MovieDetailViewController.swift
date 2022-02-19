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
    //Func for to Favorite movie.
    func actionClickFavoriteMovie(tagFilmeFavorite: Bool) {
        
        if tagFilmeFavorite {
            self.tagFilmeFavorito = false
        }else {
            self.tagFilmeFavorito = true
        }
        
        setupTableView()
        self.tableView.reloadData()
        
    }
    //Func for to selected tag of the list similar movies.
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
    
    var urlImageMovie : String = ""
    var urlDetails : String = ""
    
    func initiate(urlImageMovie : String, urlDetails : String){
        self.urlImageMovie = urlImageMovie
        self.urlDetails = urlDetails
    }
  
    @IBOutlet weak var tableView: UITableView!
    
    
    var tagFilmeFavorito : Bool = false
    var tagCheckMovie : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTableView()
  
    }
    //Update from navigation controller.
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        dataSource.navigationController = nil
    }
     //MARK: Func for to retrieves from API movie image and movie details.
    static func getModelApi(modelApi_list : Data) -> ModelApi {
        
        //Parsing the data
        
        let decoder = JSONDecoder()
        let parsedData = try! decoder.decode(ModelApi.self, from: modelApi_list )
        
       return parsedData
    }
    //MARK: Func for to retrieves from API similar movies and genre details.
    static func getModelListApi(modelListApi_list : Data) -> ModelListApi {

        //Parsing the data

        let decoder = JSONDecoder()
        let parsedData = try! decoder.decode(ModelListApi.self, from: modelListApi_list )

       return parsedData
    }

    func setupTableView () {
        print("Into function setupTable...")

        dataSource.data.removeAll()
        dataSource.navigationController = self.navigationController
   
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
        AF.request(urlImageMovie).responseJSON { response in
            if let json = response.data {

                let movieDetailsApi =  MovieDetailViewController.getModelApi(modelApi_list: json)

                var urlFull =  ("https://image.tmdb.org/t/p/w500" + movieDetailsApi.poster_path)

                let cellMovieImage = CardMovieImageModel(navigationController : self.navigationController, imageMovie: urlFull)

                self.dataSource.data.append(cellMovieImage)

                self.reloadInputViews()
            }

        }
        //MARK: func retrieves movie details: title, year, likes and popularity
        AF.request(urlDetails).responseJSON { response in
            if let json = response.data {
                
                let modelApi =  MovieDetailViewController.getModelApi(modelApi_list: json)
      
                self.dataSource.titleMovie = modelApi.original_title

                var likesMovie = modelApi.vote_count
                if likesMovie >= 1000{
                    likesMovie = likesMovie * 1/1000
                }else{
                    likesMovie = likesMovie * 1
                }
                var popularityMovie = modelApi.popularity
            
                let cellMovieTitle = CardDetailsModel(delegate: self, movieDetails: modelApi.original_title, tagFilmeFavorito: self.tagFilmeFavorito, likes: likesMovie, popularity: popularityMovie)
//
                self.dataSource.data.append(cellMovieTitle)
                
                self.tableView.reloadData()
            }
            self.tableView.reloadData()
        }
   
        //Function recover List JSON, g​etSimilarMovies​.
        AF.request("https://api.themoviedb.org/3/movie/555/similar?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US&page=1").responseJSON { response in
            if let json = response.data {

                print("Json response teste: \(json)")

                let modelResults = MovieDetailViewController.getModelListApi(modelListApi_list: json)
                
                for listResults in modelResults.results {
                   
                    var urlListImageFull =  ("https://image.tmdb.org/t/p/w500" + listResults.poster_path)
                    
                    //Format string in Int
                    var arr: [Int] = listResults.genre_ids
                    var stringArray = arr.map { String($0) }
                    
                    var movieGenre = ""
                    var countListMovieId = 0
                    for idGenre in listResults.genre_ids {
                        //Verifica se devemos adicionar a ultima virgula
                        if countListMovieId == listResults.genre_ids.count - 1 {
                            movieGenre += GlobalMethods.getGenero(idGenero: idGenre)
                            countListMovieId += 1
                        }else {
                            movieGenre += GlobalMethods.getGenero(idGenero: idGenre) + ", "
                            countListMovieId += 1
                        }
                        
                    }
                    
                    let cellListMovie = CardListMovieModel(delegate: self,  imageMovieList: urlListImageFull , listTitleMovie: listResults.title, listYear: GlobalMethods.getDataYearFromString(dateString: listResults.release_date), listGenre: movieGenre, tagCheckMovie: self.tagCheckMovie )
                    
                    self.dataSource.data.append(cellListMovie)
                    
                    self.tableView.reloadData()
                }

                self.tableView.reloadData()
            }
            self.tableView.reloadData()
        }
    }

    
}

    


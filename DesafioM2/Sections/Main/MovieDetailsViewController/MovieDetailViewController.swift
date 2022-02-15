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
        //var urlFull = https://image.tmdb.org/t/p/w200/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg
        //Retrieves data JSON using alamofire api for to add objects.
        
        //MARK: func retrieves movie Image
        AF.request("https://api.themoviedb.org/3/movie/550?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US").responseJSON { response in
            if let json = response.data {

                let movieDetailsApi =  MovieDetailViewController.getModelApi(modelApi_list: json)

//                var urlFull = URL(string: "https://image.tmdb.org/t/p/w500" + movieDetailsApi.poster_path)

                var urlFull =  ("https://image.tmdb.org/t/p/w400" + movieDetailsApi.poster_path)

                print("testUrlfull... \(urlFull)")

//                self.imageMovie.kf.setImage(with: urlFull)

//                let cellMovieImage = CardMovieImageModel(imageMovie : (urlFull ?? URL(string: "https://tm.ibxk.com.br/2021/12/02/02070127889006.jpg?ims=1120x420")!))
                
                let cellMovieImage = CardMovieImageModel(imageMovie: urlFull)

                self.dataSource.data.append(cellMovieImage)

                print("test movieDetailsApi.. \(movieDetailsApi.poster_path)")

                self.reloadInputViews()
            }

        }
        //MARK: func retrieves movie details: title, year, likes and popularity
        AF.request("https://api.themoviedb.org/3/movie/550?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US").responseJSON { response in
            if let json = response.data {
                
                let modelApi =  MovieDetailViewController.getModelApi(modelApi_list: json)
                
                print("originalTitle : \(modelApi.popularity)")
//                let voteCount = MovieDetailViewController.getModelApi(modelApi_list: json)
//
//                let popularity = MovieDetailViewController.getModelApi(modelApi_list: json)
//
//                let movieTitle = originalTitle.original_title
                var likesMovie = modelApi.vote_count
                if likesMovie >= 1000{
                    likesMovie = likesMovie * 1/1000
                }else{
                    likesMovie = likesMovie * 1
                }
                var popularityMovie = modelApi.popularity
//                popularityMovie = popularityMovie * 10
//
//                //let imageHeart = UIImage.init(systemName: "heart" )
//
                let cellMovieTitle = CardDetailsModel(delegate: self, movieDetails: modelApi.original_title, tagFilmeFavorito: self.tagFilmeFavorito, likes: likesMovie, popularity: popularityMovie)
//
                self.dataSource.data.append(cellMovieTitle)
                
                //var urlFull = URL(string: \(baseUrl) + movieDetailsApi.poster_path)
    
//                print("testUrlfull... \(originalTitle.original_title)")
              
                self.tableView.reloadData()
            }
            self.tableView.reloadData()
        }
   
        //Function recover List JSON, g​etSimilarMovies​.
        AF.request("https://api.themoviedb.org/3/movie/555/similar?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US&page=1").responseJSON { response in
            if let json = response.data {

                print("Json response teste: \(json)")

                let modelResults = MovieDetailViewController.getModelListApi(modelListApi_list: json)

//                let testResults = MovieDetailViewController.getModelListApi(modelListApi_list: json)

                print("test page... \(modelResults.page)")
                print("test results \(modelResults.results[0].title)")
                
                
                
                for listResults in modelResults.results {
                   
                    var urlListImageFull =  ("https://image.tmdb.org/t/p/w500" + listResults.poster_path)
                    
                    
                    var formatDate = listResults.release_date
                   
                    
//                    let startDate = formatDate
//                    let dateFormatter = DateFormatter()
//                    dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
//                    let dateFromStringstartDate :
//                    NSDate = dateFormatter.date(from: startDate) as! NSDate
//                    dateFormatter.dateFormat = "MM/dd/yyyy HH:mm:ss"
//                    let strstartDate = dateFormatter.string(from: dateFromStringstartDate as Date)
                    //print("test funcao data...  \(startDate)" )
               
                    print("test listResults... \(listResults.genre_ids)")
                    
                    //Conver from [int] for [string]
                    var arr: [Int] = listResults.genre_ids

                    var stringArray = arr.map { String($0) }
                    
                    
                    
                    print("test listGenre... \(listResults.genre_ids.count)")
                    
//                    var stringArray = arr.map {
//                      (number: Int) -> String in
//                      return String(number)
//                    }
                    
                    var generoFilme = ""
                    var countListMovieId = 0
                    for idGenero in listResults.genre_ids {
                        //Verifica se devemos adicionar a ultima virgula
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

    


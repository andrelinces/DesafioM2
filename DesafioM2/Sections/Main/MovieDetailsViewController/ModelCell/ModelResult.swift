//
//  ModelResult.swift
//  DesafioM2
//
//  Created by Andre Linces on 12/02/22.
//

import UIKit
import Alamofire

class ModelResult: Codable {
    internal init(id: Double, title: String, poster_path: String, release_date: String) {
        //self.adult = adult
        //self.backdrop_path = backdrop_path
        //self.genre_ids = genre_ids
//        self.results = results
        
        self.id = id
        self.title = title
        
//        self.original_language = original_language
//        self.original_title = original_title
//        self.overview = overview
//        self.popularity = popularity
        self.poster_path = poster_path
        self.release_date = release_date
//        self.video = video
//        self.vote_average = vote_average
//        self.vote_count = vote_count
    }
    
    
    //var adult: Bool
    //var backdrop_path: Int
    //var genre_i[ds: NArray
//    var results: [[String]]
    
    var id: Double
    var title: String
    
//    var original_language: String
//    var original_title: String
//    var overview: String
//    var popularity: Double
    var poster_path: String
    var release_date: String
//    var video: Bool
//    var vote_average: Int
//    var vote_count: Int
    
}

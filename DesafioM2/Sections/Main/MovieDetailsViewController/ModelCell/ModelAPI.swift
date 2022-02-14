//
//  ModelApi.swift
//  DesafioM2
//
//  Created by Andre Linces on 10/02/22.
//

import UIKit

class ModelApi: Codable {
    
    internal init(poster_path: String, original_title: String, vote_count: Int, popularity: Double) {
        
        self.poster_path = poster_path
        self.original_title = original_title
        self.vote_count = vote_count
        self.popularity = popularity
        
    }
    
    var poster_path : String
    var original_title: String
    var vote_count: Int
    var popularity: Double
    
}


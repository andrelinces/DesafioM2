//
//  ModelApi.swift
//  DesafioM2
//
//  Created by Andre Linces on 10/02/22.
//

import UIKit

class ModelApi: Codable {
    
    internal init(poster_path: String, original_title: String) {
        
        self.poster_path = poster_path
        self.original_title = original_title
        
    }
    
    var poster_path : String
    var original_title: String
    
}


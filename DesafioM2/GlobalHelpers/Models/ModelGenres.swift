//
//  ModelGenre.swift
//  DesafioM2
//
//  Created by Andre Linces on 14/02/22.
//

import UIKit

class ModelGenres: Codable{
    //Retrieves array object of the objetc genre_ids that are in results
    internal init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    
    var id: Int
    var name: String
    

}

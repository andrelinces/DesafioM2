//
//  ModelListGenres.swift
//  DesafioM2
//
//  Created by Andre Linces on 20/02/22.
//

import UIKit

class ModelListGenres: Codable {
    internal init(genres: [ModelGenres] ) {
        self.genres = genres
    }
     
    var genres : [ModelGenres]
}

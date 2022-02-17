//
//  ModelResult.swift
//  DesafioM2
//
//  Created by Andre Linces on 12/02/22.
//

import UIKit
import Alamofire
import SwiftUI

class ModelResult: Codable {
    internal init(id: Double, title: String, poster_path: String, release_date: String, genre_ids: [Int]) {
        //MARK: List of the objects retrieved do Array Object
        self.genre_ids = genre_ids
        self.id = id
        self.title = title
        self.poster_path = poster_path
        self.release_date = release_date

    }
    //initialization variables.
    var genre_ids: [Int]
    var id: Double
    var title: String
    var poster_path: String
    var release_date: String

}

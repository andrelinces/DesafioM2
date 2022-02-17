//
//  ModelListApi.swift
//  DesafioM2
//
//  Created by Andre Linces on 12/02/22.
//

import UIKit

class ModelListApi: Codable {
    //MARK: Retrieves model API Results, Array Object
    internal init(page: Int, results: [ModelResult] ) {
       
        self.page = page
        self.results = results
   
    }
    
    var page: Int
    var results : [ModelResult]

}
    


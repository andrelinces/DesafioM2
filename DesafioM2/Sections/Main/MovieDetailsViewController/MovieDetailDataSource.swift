//
//  DataSource.swift
//  DesafioM2
//
//  Created by Andre Linces on 08/02/22.
//

import UIKit

class MovieDetailDataSource: NSObject {
    
    var data = [Any] ()
    var navigationController: UINavigationController?
    
    func initializeTableView(tableView: UITableView){
        
        tableView.dataSource = self
        
        //Registing the cells in dataSource
        tableView.register(UINib(nibName: "CardDetailsModelCell", bundle: Bundle.main), forCellReuseIdentifier: "CardDetailsModelCellIdentifier")
        tableView.register(UINib(nibName: "CardMovieImageModelCell", bundle: Bundle.main), forCellReuseIdentifier: "CardMovieImageModelCellIdentifier")
        tableView.register(UINib(nibName: "CardListMovieModelCell", bundle: Bundle.main), forCellReuseIdentifier: "CardListMovieModelCellIdentifier")
    }
}

extension MovieDetailDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    //Displays types of the cells registered. 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let modelCardDetails = data[indexPath.row] as? CardDetailsModel {
            
            return modelCardDetails.cellForTableView(tableView: tableView, atIndexpath: indexPath)
            
        }else if let modelMovieImage = data[indexPath.row] as? CardMovieImageModel{
            
            return modelMovieImage.cellForTableView(tableView: tableView, atIndexpath: indexPath)
            
        }else if let modelListMovie = data[indexPath.row] as? CardListMovieModel{
            
            return modelListMovie.cellForTableView(tableView: tableView, atIndexpath: indexPath)
            
        }else{
            
            return UITableViewCell()
            
        }
    }
    
}


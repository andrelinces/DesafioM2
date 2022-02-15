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
    var titleMovie = ""
    
    func initializeTableView(tableView: UITableView){
        
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.alpha = 0
        navigationController?.navigationBar.backItem?.title = "Voltar"
        navigationController?.navigationBar.tintColor = .black
        
        print("title : \(titleMovie)")
        
        //Registing the cells
        tableView.register(UINib(nibName: "CardDetailsModelCell", bundle: Bundle.main), forCellReuseIdentifier: "CardDetailsModelCellIdentifier")
        tableView.register(UINib(nibName: "CardMovieImageModelCell", bundle: Bundle.main), forCellReuseIdentifier: "CardMovieImageModelCellIdentifier")
        tableView.register(UINib(nibName: "CardListMovieModelCell", bundle: Bundle.main), forCellReuseIdentifier: "CardListMovieModelCellIdentifier")
    }
}

extension MovieDetailDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
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
    
    //funciton for scrollview when the user scroll the list, show navigation bar
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scroll contentOffset: \(scrollView.contentOffset.y)")
        
        if navigationController != nil {
            if scrollView.contentOffset.y > 30 {
                
                navigationController?.navigationBar.alpha = scrollView.contentOffset.y / 180
                
            }else{
                navigationController?.navigationBar.alpha = 0
                
            }
            
            
            if scrollView.contentOffset.y > 304 {
                navigationController?.navigationBar.topItem?.title = titleMovie
            }else {
                navigationController?.navigationBar.topItem?.title = ""
            }
        }
        
    }
    
}



//
//  DataSource.swift
//  DesafioM2
//
//  Created by Andre Linces on 08/02/22.
//

import UIKit

class DataSource: NSObject {
    
    var data = [Any] ()
    var navigationController: UINavigationController?
    
    func initializeTableView(tableView: UITableView){
        
        tableView.dataSource = self
        //tableView.delegate = self
        
        //Registing the cells
        tableView.register(UINib(nibName: "CardDetailsModelCell", bundle: Bundle.main), forCellReuseIdentifier: "movieDetailsIdentifier")
    }
}

extension DataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let modelCardDetails = data[indexPath.row] as? ModelCardDetails {
            
            return modelCardDetails.cellForTableView(tableView: tableView, atIndexpath: indexPath)
            
        }else{
            
            return UITableViewCell()
            
        }
    }
    
}

//funciton for scrollview when the user scroll the list, show navigation bar
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("Scroll contentOffset: \(scrollView.contentOffset.y)")
//        if scrollView.contentOffset.y > 10 {
//
//            navigationController?.navigationBar.alpha = scrollView.contentOffset.y / 100
//
//        }else{
//
//            navigationController?.navigationBar.alpha = 0
//
//        }
//    }

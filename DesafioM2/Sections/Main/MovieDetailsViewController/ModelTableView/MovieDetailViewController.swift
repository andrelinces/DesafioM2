//
//  MovieDetailViewController.swift
//  DesafioM2
//
//  Created by Andre Linces on 08/02/22.
//

import UIKit

class MovieDetailViewController: UIViewController, ModelCardDetailsCallBack {
    func actionClickCardView(indexPath: IndexPath) {
        
    }
    
    
    
    let dataSource = DataSource()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("passou no didload....")
    
        setupTableView()
        //tableView.reloadData()
    }
    
    func setupTableView () {
        print("Into function setupTable...")
        
        let cellMovieDetails = ModelCardDetails(delegate: self, movieDetails: "Teste um")
        let cellMovieDetails2 = ModelCardDetails(delegate: self, movieDetails: "Teste Dois")


        dataSource.data.append(cellMovieDetails)

        dataSource.data.append(cellMovieDetails2)


        dataSource.initializeTableView(tableView: tableView)

        tableView.allowsSelection = false

        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none


    }

}

    


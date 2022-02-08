//
//  GlobalProtocol.swift
//  DesafioM2
//
//  Created by Andre Linces on 08/02/22.
//

import UIKit

//Defines which method will be used for to tableview.
protocol tableViewCompatible {
    
    var reuseIdentifier : String {get}
    
    func cellForTableView ( tableView: UITableView, atIndexpath indexpath: IndexPath ) -> UITableViewCell

}

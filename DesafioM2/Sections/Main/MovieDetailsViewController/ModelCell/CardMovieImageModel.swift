//
//  CardMovieImageModel.swift
//  DesafioM2
//
//  Created by Andre Linces on 12/02/22.
//

import UIKit
import Kingfisher

class CardMovieImageModel: tableViewCompatible {
    internal init (imageMovie: String){
        self.imageMovie = imageMovie
    }
    
    var reuseIdentifier: String {
        
        return "CardMovieImageModelCellIdentifier"
    }
    
    //variáveis de inicialização
    var imageMovie: String
    
    func cellForTableView(tableView: UITableView, atIndexpath indexpath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexpath) as? CardMovieImageModelCell {
            
            cell.setupDesign()
            cell.setupValues(imageMovie: imageMovie)
            
            return cell
            
            
        }else{
            
            return UITableViewCell()
            
        }
    }
    
}

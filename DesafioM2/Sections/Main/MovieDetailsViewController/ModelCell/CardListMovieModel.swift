//
//  CardListMovieModel.swift
//  DesafioM2
//
//  Created by Andre Linces on 12/02/22.
//

import UIKit

//protocol CardListMovieModelCallBack: class {
//
//
//}
class CardListMovieModel: tableViewCompatible {
    internal init (imageMovieList: String, listTitleMovie: String, listYear: String, listGenre: String, imageChebox: String){
        
        self.imageMovieList = imageMovieList
        self.listTitleMovie = listTitleMovie
        self.listYear = listYear
        self.listGenre = listGenre
        self.imageChebox = imageChebox
        
    }
    
    var reuseIdentifier: String {
        
        return "CardListMovieModelCellIdentifier"
    }
    
    //variáveis de inicialização
    var imageMovieList: String
    var listTitleMovie: String
    var listYear: String
    var listGenre: String
    var imageChebox: String
    
    func cellForTableView(tableView: UITableView, atIndexpath indexpath: IndexPath) -> UITableViewCell {
        
       if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexpath) as? CardListMovieModelCell {
            
            //cell.setupDesign()
            cell.setupValues(imageMovieList: imageMovieList, listTitleMovie: listTitleMovie, listYear: listYear, listGenre: listGenre, imageChebox: imageChebox)
            
            return cell
            
        }else{
            
            return UITableViewCell()
        }
        
    }
    
}

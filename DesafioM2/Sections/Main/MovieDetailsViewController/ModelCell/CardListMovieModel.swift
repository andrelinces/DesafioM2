//
//  CardListMovieModel.swift
//  DesafioM2
//
//  Created by Andre Linces on 12/02/22.
//

import UIKit

protocol CardListMovieModelCallBack: class {
    func actionClickCardView (indexPath: IndexPath)
    func actionClickCheckMovie(tagCheckMovie : Bool)

}
class CardListMovieModel: tableViewCompatible {
    internal init (delegate: CardListMovieModelCallBack?, imageMovieList: String, listTitleMovie: String, listYear: String, listGenre: [Int], tagCheckMovie: Bool) {
        
        self.delegate = delegate
        self.imageMovieList = imageMovieList
        self.listTitleMovie = listTitleMovie
        self.listYear = listYear
        self.listGenre = listGenre
        self.tagCheckMovie = tagCheckMovie
        
    }
    open weak var delegate: CardListMovieModelCallBack?
    
    var reuseIdentifier: String {
        
        return "CardListMovieModelCellIdentifier"
    }
    
    //variáveis de inicialização
    var imageMovieList: String
    var listTitleMovie: String
    var listYear: String
    var listGenre: [Int]
    var tagCheckMovie: Bool
    
    
    func cellForTableView(tableView: UITableView, atIndexpath indexpath: IndexPath) -> UITableViewCell {
        
       if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexpath) as? CardListMovieModelCell {
            
            //cell.setupDesign()
           
            cell.setupValues(imageMovieList: imageMovieList, listTitleMovie: listTitleMovie, listYear: listYear, listGenre: listGenre)
            cell.setupCheck(tagCheckMovie: tagCheckMovie)
           
           //Adding clicks in card1view...
           let gestureCliqueCard = myTapCustom(target: self, action: #selector(actionClickCardView))
           gestureCliqueCard.indexPath = indexpath
           
           cell.cardViewList.addGestureRecognizer(gestureCliqueCard)
           
           let gestureCliqueFavoriteMovie = myTapCustomCheckMovie(target: self, action: #selector(actionClickCheckMovie))
           gestureCliqueFavoriteMovie.tagCheckMovie = tagCheckMovie
           
           cell.imageViewChebox.addGestureRecognizer(gestureCliqueFavoriteMovie)
           cell.imageViewChebox.isUserInteractionEnabled = true
            
            return cell
            
        }else{
            
            return UITableViewCell()
        }
        
    }
    
    @objc func actionClickCardView (sender: myTapCustom) {

        delegate?.actionClickCardView(indexPath: sender.indexPath!)
        print("test label card1model: \(sender.indexPath!)")
    }
    
    @objc func actionClickCheckMovie(sender: myTapCustomCheckMovie) {

        delegate?.actionClickCheckMovie(tagCheckMovie: sender.tagCheckMovie!)
    }
    
    class myTapCustom: UITapGestureRecognizer {

        var indexPath: IndexPath?

    }
    
    class myTapCustomCheckMovie: UITapGestureRecognizer {

        var tagCheckMovie: Bool?
        

    }
    
}

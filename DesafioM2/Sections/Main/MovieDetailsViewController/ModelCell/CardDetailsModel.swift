//
//  ModelCardDetails.swift
//  DesafioM2
//
//  Created by Andre Linces on 08/02/22.
//

import UIKit
import SwiftUI

protocol CardDetailsModelCallBack: class {
    func actionClickCardView (indexPath: IndexPath)
    func actionClickFavoriteMovie(tagFilmeFavorite : Bool)
}

class CardDetailsModel: tableViewCompatible {
    internal init(delegate: CardDetailsModelCallBack?,  movieDetails: String, tagFilmeFavorito: Bool, likes: Int, popularity: Double) {
        self.delegate = delegate
        self.movieDetails = movieDetails
        self.tagFilmeFavorito = tagFilmeFavorito
        self.likes = likes
        self.popularity = popularity
        
    }
    
    open weak var delegate:CardDetailsModelCallBack?
    
    var reuseIdentifier: String {
        
        return "CardDetailsModelCellIdentifier"
    }
    
    //variáveis de inicialização
    var movieDetails: String
    var tagFilmeFavorito: Bool
    var likes: Int
    var popularity: Double
    
    func cellForTableView(tableView: UITableView, atIndexpath indexpath: IndexPath) -> UITableViewCell {
      
        //It is starting the cell attributes (design, values...) declared in the modelCell.
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexpath) as? CardDetailsModelCell{
            
            //Effect applied to the cell border, when the cell has a border.
            //cell.borderDesigneView(cornerRadius: 50)
            cell.setupValues(movieDetails: movieDetails, likes: likes, popularity: popularity)
            cell.setupImage(tagFilmeFavorito: tagFilmeFavorito)
    
            
            //Adding clicks in cardView...
            let gestureCliqueCard = myTapCustom(target: self, action: #selector(actionClickCardView))
            gestureCliqueCard.indexPath = indexpath
            
            cell.cardViewMovieDetails.addGestureRecognizer(gestureCliqueCard)
            
            let gestureCliqueFavoriteMovie = myTapCustomFavoriteMovie(target: self, action: #selector(actionClickFavoriteMovie))
            gestureCliqueFavoriteMovie.tagFavoriteMovie = tagFilmeFavorito
            
            cell.imageViewHeart.addGestureRecognizer(gestureCliqueFavoriteMovie)
            cell.imageViewHeart.isUserInteractionEnabled = true
            
            return cell

        }else{

            return UITableViewCell()
            
        }
    }
    //MARK: FUNC for to atribut click in cards and retrieves the a position ot the cell selected.
    @objc func actionClickCardView (sender: myTapCustom) {

        delegate?.actionClickCardView(indexPath: sender.indexPath!)
        print("test label card1model: \(sender.indexPath!)")
    }
    
    @objc func actionClickFavoriteMovie(sender: myTapCustomFavoriteMovie) {

        delegate?.actionClickFavoriteMovie(tagFilmeFavorite: sender.tagFavoriteMovie!)
    }
    
    class myTapCustom: UITapGestureRecognizer {

        var indexPath: IndexPath?

    }
    
    class myTapCustomFavoriteMovie: UITapGestureRecognizer {

        var tagFavoriteMovie: Bool?
        

    }
    
}




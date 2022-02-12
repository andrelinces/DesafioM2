//
//  CardDetailsModelCell.swift
//  DesafioM2
//
//  Created by Andre Linces on 08/02/22.
//

import UIKit

class CardDetailsModelCell: UITableViewCell {
    
    @IBOutlet weak var cardViewMovieDetails: UIView!
    @IBOutlet weak var labelMovieDetails: UILabel!
    @IBOutlet weak var imageViewHeart: UIImageView!
    
    
    func setupDesign () {

        cardViewMovieDetails.changeDesigneView(cornerRadius: 28, shadow: CGSize(width: 0, height: 2) , shadowOpacity: 0.3)
      
    }

    func setupValues (movieDetails: String ) {

        labelMovieDetails.text = movieDetails
        
    }
    
    func setupImage (tagFilmeFavorito: Bool ) {
        
        //Verifica se o filme è favorito
        if tagFilmeFavorito {
            imageViewHeart.image = UIImage(systemName: "heart.fill")
            imageViewHeart.tintColor = .red
        }else {
            imageViewHeart.image = UIImage(systemName: "heart")
            imageViewHeart.tintColor = .lightGray
        }
        
        
    }
}

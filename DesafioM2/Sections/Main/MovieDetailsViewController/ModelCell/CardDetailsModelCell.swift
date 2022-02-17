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
    @IBOutlet weak var labellikes: UILabel!
    @IBOutlet weak var labelPropularity: UILabel!
    
    //Func used for to define of the desing from cell.
    func setupDesign () {

        cardViewMovieDetails.changeDesigneView(cornerRadius: 28, shadow: CGSize(width: 0, height: 2) , shadowOpacity: 0.3)
      
    }
    //Func used for to define whats itens from cell, to be loading.
    func setupValues (movieDetails: String, likes: Int, popularity: Double ) {

        labelMovieDetails.text = movieDetails
        if likes <= 999 {
            labellikes.text = String(likes)+"k" + " Likes"
        }else{
            labellikes.text = String(likes) + " Likes"
        }
        
        labelPropularity.text = "Popularity " + String(popularity)
    }
    //Func used for to define image cell, to be loading.
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

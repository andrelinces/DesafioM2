//
//  CardMovieImageModelCell.swift
//  DesafioM2
//
//  Created by Andre Linces on 12/02/22.
//

import UIKit

class CardMovieImageModelCell: UITableViewCell {
    
    @IBOutlet weak var imageViewMovie: UIImageView!
    
    
    func setupDesign () {

//        cardImageMovieView.changeDesigneView(cornerRadius: 28, shadow: CGSize(width: 0, height: 2) , shadowOpacity: 0.3)
      
    }

    func setupValues (imageMovie: URL) {

        print("numero de subview\(imageViewMovie.layer.sublayers?.count)")
        
        imageViewMovie.downloaded(from: imageMovie)
        imageViewMovie.contentMode = .scaleAspectFill
        
        //Caso o gradiente nao tenha sido adicionado na layer
        if imageViewMovie.layer.sublayers == nil {
            imageViewMovie.addBlackGradientLayerInForeground(frame: imageViewMovie.bounds, colors:[.clear, .black])
        }
    }
    
    
}

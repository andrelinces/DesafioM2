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

        imageViewMovie.downloaded(from: imageMovie)
        imageViewMovie.contentMode = .scaleAspectFill
        imageViewMovie.addBlackGradientLayerInForeground(frame: imageViewMovie.bounds, colors:[.clear, .black])
    }
    
    
}

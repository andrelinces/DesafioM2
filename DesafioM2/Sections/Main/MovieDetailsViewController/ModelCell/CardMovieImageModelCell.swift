//
//  CardMovieImageModelCell.swift
//  DesafioM2
//
//  Created by Andre Linces on 12/02/22.
//

import UIKit

class CardMovieImageModelCell: UITableViewCell {
    
    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var cornerViewButtonReturn : UIView!
    
    
    func setupDesign () {

        //Button rounding return.
        cornerViewButtonReturn.changeDesigneView(cornerRadius: cornerViewButtonReturn.frame.height/2, shadow: CGSize(width: 0, height: 0), shadowOpacity: 0)
    }

    func setupValues (imageMovie: String) {

        print("numero de subview\(imageViewMovie.layer.sublayers?.count)")

        imageViewMovie.downloaded(from: imageMovie)
        imageViewMovie.contentMode = .scaleAspectFill

        //If the gradient has not been added to the layer.
        if imageViewMovie.layer.sublayers == nil {
            imageViewMovie.addBlackGradientLayerInForeground(frame: imageViewMovie.bounds, colors:[.clear, .black])
        }
    }

}

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
    @IBOutlet weak var buttonRetornar : UIButton!
    
    func setupDesign () {

        cornerViewButtonReturn.changeDesigneView(cornerRadius: cornerViewButtonReturn.frame.height/2, shadow: CGSize(width: 0, height: 0), shadowOpacity: 0)
      
    }

    func setupValues (imageMovie: String) {
        
        print("numero de subview\(imageViewMovie.layer.sublayers?.count)")
        
        imageViewMovie.downloaded(from: imageMovie)
        imageViewMovie.contentMode = .scaleAspectFill
        
        //In case gradient don't have apllyed correcty.
        if imageViewMovie.layer.sublayers == nil {
            imageViewMovie.addBlackGradientLayerInForeground(frame: imageViewMovie.bounds, colors:[.clear, .black])
        }
    }
    
}

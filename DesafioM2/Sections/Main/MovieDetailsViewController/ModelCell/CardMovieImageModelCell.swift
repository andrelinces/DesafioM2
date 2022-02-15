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

//        cardImageMovieView.changeDesigneView(cornerRadius: 28, shadow: CGSize(width: 0, height: 2) , shadowOpacity: 0.3)
        
        cornerViewButtonReturn.changeDesigneView(cornerRadius: cornerViewButtonReturn.frame.height/2, shadow: CGSize(width: 0, height: 0), shadowOpacity: 0)
      
    }

    func setupValues (imageMovie: String) {

        print("numero de subview\(imageViewMovie.layer.sublayers?.count)")

        imageViewMovie.downloaded(from: imageMovie)
        imageViewMovie.contentMode = .scaleAspectFill

        //Caso o gradiente nao tenha sido adicionado na layer
        if imageViewMovie.layer.sublayers == nil {
            imageViewMovie.addBlackGradientLayerInForeground(frame: imageViewMovie.bounds, colors:[.clear, .black])
        }
    }
//    func setupValues (imageMovie: String){
//
//        imageViewMovie.image = UIImage(named: imageMovie)
//
//    }

}

//
//  CardListMovieCell.swift
//  DesafioM2
//
//  Created by Andre Linces on 12/02/22.
//

import UIKit

class CardListMovieModelCell: UITableViewCell {
    
    @IBOutlet weak var cardViewList: UIView!
    @IBOutlet weak var imageViewMovieList: UIImageView!
    @IBOutlet weak var labelListTitleMovie: UILabel!
    @IBOutlet weak var labelListYear: UILabel!
    @IBOutlet weak var labelListGenre: UILabel!
    @IBOutlet weak var imageViewChebox: UIImageView!
    
    func setupDesign () {

        cardViewList.changeDesigneView(cornerRadius: 28, shadow: CGSize(width: 0, height: 2) , shadowOpacity: 0.3)
      
    }

    func setupValues (imageMovieList: String, listTitleMovie: String, listYear: String, listGenre: String, imageChebox: String) {
        
        //It Show imageMovie in similar List, and to displaying image correct.
        imageViewMovieList.downloaded(from: imageMovieList)
        imageViewMovieList.contentMode = .scaleAspectFill
        
        labelListTitleMovie.text = listTitleMovie
        labelListYear.text = listYear
        labelListGenre.text = listGenre
        imageViewChebox.image = UIImage(named: imageChebox)
    }
    
}

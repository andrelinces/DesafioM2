//
//  SelectMovieDetailsViewController.swift
//  DesafioM2
//
//  Created by Andre Linces on 15/02/22.
//

import UIKit

class SelectMovieDetailsViewController: UIViewController {

    @IBOutlet weak var buttonFilme1 : UIButton!
    @IBOutlet weak var buttonFilme2 : UIButton!
    @IBOutlet weak var buttonFilme3 : UIButton!
    @IBOutlet weak var buttonFilme4 : UIButton!
    
    var urlImageMovie : String = ""
    var urlDetails : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupDesing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieDetails = segue.destination as? MovieDetailViewController {
            movieDetails.initiate(urlImageMovie: urlImageMovie, urlDetails: urlDetails)
        }
    }
    
    func setupDesing(){
        
        buttonFilme1.changeDesigneView(cornerRadius: buttonFilme1.frame.height/2, shadow: CGSize(width: 0, height: 2), shadowOpacity: 0.3)
        buttonFilme2.changeDesigneView(cornerRadius: buttonFilme1.frame.height/2, shadow: CGSize(width: 0, height: 2), shadowOpacity: 0.3)
        buttonFilme3.changeDesigneView(cornerRadius: buttonFilme1.frame.height/2, shadow: CGSize(width: 0, height: 2), shadowOpacity: 0.3)
        buttonFilme4.changeDesigneView(cornerRadius: buttonFilme1.frame.height/2, shadow: CGSize(width: 0, height: 2), shadowOpacity: 0.3)
        
    }
    
    @IBAction func selectMovie1(sender : UIButton) {
        
        urlImageMovie = "https://api.themoviedb.org/3/movie/603?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US"
        
        urlDetails = "https://api.themoviedb.org/3/movie/603?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US"
        
        performSegue(withIdentifier: "segueMovieDetails", sender: nil)
        
    }
    
    @IBAction func selectMovie2(sender : UIButton) {
        
        urlImageMovie = "https://api.themoviedb.org/3/movie/336843?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US"
        
        urlDetails = "https://api.themoviedb.org/3/movie/336843?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US"
        
        performSegue(withIdentifier: "segueMovieDetails", sender: nil)
    }
    
    @IBAction func selectMovie3(sender : UIButton) {
        
        urlImageMovie = "https://api.themoviedb.org/3/movie/550?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US"
        
        urlDetails = "https://api.themoviedb.org/3/movie/550?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US"
        
        performSegue(withIdentifier: "segueMovieDetails", sender: nil)
    }
    
    @IBAction func selectMovie4(sender : UIButton) {
        
        urlImageMovie = "https://api.themoviedb.org/3/movie/503?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US"
        
        urlDetails = "https://api.themoviedb.org/3/movie/503?api_key=8f04577aff690de3a89bef5e5f666fe5&language=en-US"
        
        performSegue(withIdentifier: "segueMovieDetails", sender: nil)
    }

}

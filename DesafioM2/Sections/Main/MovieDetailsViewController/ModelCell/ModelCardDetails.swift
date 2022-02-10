//
//  ModelCardDetails.swift
//  DesafioM2
//
//  Created by Andre Linces on 08/02/22.
//

import UIKit

protocol ModelCardDetailsCallBack: class {
    func actionClickCardView (indexPath: IndexPath)
}

class ModelCardDetails: tableViewCompatible {
    internal init(delegate: ModelCardDetailsCallBack?,  movieDetails: String) {
        self.delegate = delegate
        self.movieDetails = movieDetails
    }
    
    open weak var delegate: ModelCardDetailsCallBack?
    
    var reuseIdentifier: String {
        
        return "movieDetailsIdentifier"
    }
    
    //variáveis de inicialização
    var movieDetails: String
    
    func cellForTableView(tableView: UITableView, atIndexpath indexpath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexpath) as? CardDetailsModelCell{

            //Inicializando a célula (design, values etc...) atributos declarados na 'modelCell
            //       cell.setupDesign()
            cell.setupDesign()
            
            cell.setupValues(movieDetails: movieDetails)
            
            //test cell tableView
            //cell.textLabel?.text = "test cell tableView"
            
            //Adding clicks in card1view...
            let gestureCliqueCard = myTapCustom(target: self, action: #selector(actionClickCardView))
            gestureCliqueCard.indexPath = indexpath
            
            cell.cardViewMovieDetails.addGestureRecognizer(gestureCliqueCard)
            
            return cell

        }else{

            return UITableViewCell()
            
        }
    }
    
    @objc func actionClickCardView (sender: myTapCustom) {

        delegate?.actionClickCardView(indexPath: sender.indexPath!)
        print("test label card1model: \(sender.indexPath!)")
    }
    
    class myTapCustom: UITapGestureRecognizer {

        var indexPath: IndexPath?

    }
    
}




//
//  CardMovieImageModel.swift
//  DesafioM2
//
//  Created by Andre Linces on 12/02/22.
//

import UIKit


class CardMovieImageModel: tableViewCompatible {
    internal init (navigationController : UINavigationController?, imageMovie: String){
        self.imageMovie = imageMovie
    }
    
    var reuseIdentifier: String {
        
        return "CardMovieImageModelCellIdentifier"
    }
    
    //Variables of the inicilizaing.
    var imageMovie: String
    var navigationController : UINavigationController?
    
    func cellForTableView(tableView: UITableView, atIndexpath indexpath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexpath) as? CardMovieImageModelCell {
            
            cell.setupDesign()
            cell.setupValues(imageMovie: imageMovie)
            
            cell.buttonRetornar.addTarget(self, action: #selector(acaoRetornar), for: .touchUpInside)
            
            return cell
            
            
        }else{
            
            return UITableViewCell()
            
        }
    }
    //func button return.
    @objc func acaoRetornar(sender : UITapGestureRecognizer){
        print("Teste voltar : \(navigationController)")
        navigationController?.popViewController(animated: true)
    }
    
}

//
//  ModelCardDetails.swift
//  DesafioM2
//
//  Created by Andre Linces on 08/02/22.
//

import UIKit

protocol ModelCardDetailsCallBack: class {
    //func acaoBotaoRetornar()
}

class ModelCardDetails: tableViewCompatible {
    internal init(delegate: ModelCardDetailsCallBack,  movieDetails: String) {
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexpath) as? ModelCardDetails {
            
            //Inicializando a célula (design, values etc...) atributos declarados na 'modelCell
            //       cell.setupDesign()
            
        }else{
        
        return UITableViewCell()
        
        }
        
    }
}
//Montando a célula modelo
//func cellForTableView(tableView: UITableView, atIndexpath indexPath: IndexPath) -> UITableViewCell {
//
//    if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? Card1ModelCell {
//
//        //Inicializando a célula (design, values etc...) atributos declarados na 'modelCell
//        cell.setupDesign()
//
//        cell.setupValues(tituloCard: tituloCard)
//
//        //Adicionando cliques no cardView
//        cell.cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(acaoCliqueCardView)))
//
//        return cell
//
//    }else{
//
//    return UITableViewCell()
//
//    }
//
//}

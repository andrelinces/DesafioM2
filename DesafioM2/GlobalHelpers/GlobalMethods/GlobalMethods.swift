//
//  GlobalMethods.swift
//  DesafioM2
//
//  Created by Andre Linces on 08/02/22.
//

import UIKit

extension UIView {
    
    //Defines the designer to cell model.
    func changeDesigneView(cornerRadius: CGFloat, shadow: CGSize, shadowOpacity: Float){
        
        self.layer.shadowOffset = shadow
        
        self.layer.shadowOpacity = shadowOpacity
        
    }
    
    //Modelcardview
    func borderDesigneView(cornerRadius: CGFloat){
        
        self.layer.cornerRadius = cornerRadius
        
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        self.layer.shadowOpacity = 0.2
        
    }
      
}
   

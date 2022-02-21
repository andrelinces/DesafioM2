//
//  GlobalMethods.swift
//  DesafioM2
//
//  Created by Andre Linces on 12/02/22.
//

import UIKit

class GlobalMethods {
    //
   static func getDataYearFromString (dateString : String) -> String {
 
       //MARK: Formates data retrives from API of the type 'string'
       let dateFormatter = DateFormatter()
       dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
       dateFormatter.dateFormat = "yyyy-MM-dd"
       let date = dateFormatter.date(from:dateString)!
       
        let formatter = DateFormatter()

       formatter.dateFormat = "yyyy"
        let myString = formatter.string(from: date as Date)
 
        return myString
    }
        
}

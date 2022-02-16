//
//  GlobalMethods.swift
//  DesafioM2
//
//  Created by Andre Linces on 12/02/22.
//

import UIKit

class GlobalMethods {
    //MARK: Func for to convert date.
   static func getDataYearFromString (dateString : String) -> String {

       let dateFormatter = DateFormatter()
       dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
       dateFormatter.dateFormat = "yyyy-MM-dd"
       let date = dateFormatter.date(from:dateString)!
       
        let formatter = DateFormatter()

       //Format date for to display only the year of the filme.
       formatter.dateFormat = "yyyy"
        let myString = formatter.string(from: date as Date)
   
        return myString
    }
    //MARK: Func model for to compare, JSON retrieved with list from genres.
    static func getGenero(idGenero : Int) -> String {
        
        switch idGenero {
        case 28:
            return "Action"
        case 12:
            return "Adventure"
        case 16:
            return "Animation"
        case 35:
            return "Comedy"
        case 80:
            return "Crime"
        case 99:
            return "Documentary"
        case 18:
            return "Drama"
        case 10751:
            return "Family"
        case 14:
            return "Fantasy"
        case 36:
            return "History"
        case 27:
            return "Horror"
        case 10402:
            return "Music"
        case 9648:
            return "Mystery"
        case 10749:
            return "Romance"
        case 878:
            return "Science Fiction"
        case 10770:
            return "TV Movie"
        case 53:
            return "Thriller"
        case 10752:
            return "War"
        case 37:
            return "Western"
        default:
            return "Action"
        }
      
    }
       
}

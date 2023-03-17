//
//  Metodos.swift
//  NuevaPruebaRick
//
//  Created by Gimabelle Garcia vasquez on 1/11/22.
//

import Foundation
import UIKit

class Metodos{
    
    func HoraFecha(opc: String) -> String {
        let dateFormatterGet = DateFormatter()
        if opc == "track"{
           dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }else{
           dateFormatterGet.dateFormat = "HH:mm:ss"
        }

        return dateFormatterGet.string(from: Date())
    }
    
    func ReplaceChar(data:String,searchText:String)->Bool{
        return data.replacingOccurrences(of: "ú", with: "u")
            .replacingOccurrences(of: "á", with: "a")
            .replacingOccurrences(of: "é", with: "e")
            .replacingOccurrences(of: "í", with: "i")
            .replacingOccurrences(of: "ó", with: "o")
            .replacingOccurrences(of: "ñ", with: "n")
            .lowercased().contains(searchText.replacingOccurrences(of: "ú", with: "u")
                .replacingOccurrences(of: "á", with: "a")
                .replacingOccurrences(of: "é", with: "e")
                .replacingOccurrences(of: "í", with: "i")
                .replacingOccurrences(of: "ó", with: "o")
                .replacingOccurrences(of: "ñ", with: "n")
                .lowercased())
    }
    
}

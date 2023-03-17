//
//  RickYMortyVM.swift
//  NuevaPruebaRick
//
//  Created by Gimabelle Garcia vasquez on 8/10/22.
//

import Foundation
import Alamofire

class RickYMortVM {
    
    static var rickymorty_ : RickYMorty?
    
   static func retrieveData() { // consumir api 
       AF.request("https://rickandmortyapi.com/api/episode" , method: .get).responseDecodable(of: RickYMorty.self) {  response in
           print("response:\(response)")
       }
    }
    static func retrieveData(completion: @escaping (RickYMorty?) -> ()){ // Completion
        
        AF.request("https://rickandmortyapi.com/api/episode" , method: .get).responseDecodable(of: RickYMorty.self) {  response in
            self.rickymorty_ = response.value
            completion(self.rickymorty_)
            return
        }
       
     }
        
}

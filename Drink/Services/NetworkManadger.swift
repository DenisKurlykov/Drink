//
//  NetworkManadger.swift
//  Drink
//
//  Created by Денис Курлыков on 15.08.2022.
//

import Foundation
import Alamofire


enum Link: String {
    case drinksURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
    case postRequest = "https://jsonplaceholder.typicode.com/posts"
}

class NetworkManadger {
    static let shared = NetworkManadger()
        
        private init() {}
    
//    func fetchData(url: String, complition: @escaping(Drinks) -> Void) {
//        guard let url = URL(string: url) else { return }
//        let shared = URLSession.shared
//        shared.dataTask(with: url) { data, _, error in
//            do {
//                let drink = try JSONDecoder().decode(Drinks.self, from: data!)
//                complition(drink)
//            }catch let error {
//                print(error)
//            }
//            
//        }.resume()
//    }
}


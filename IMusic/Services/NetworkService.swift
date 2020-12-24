//
//  NetworkService.swift
//  IMusic
//
//  Created by Дмитрий Рудаков on 21.12.2020.
//

import UIKit
import Alamofire

class NetworkService {
    
    func fetchTracks(searchText: String, complition: @escaping (SearchResponse?) -> Void) {
        let url = "https://itunes.apple.com/search"
        let parametrs = ["term":"\(searchText)",
                         "limit":"10",
                         "media":"music"]
        
        AF.request(url, method: .get, parameters: parametrs, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print(error.localizedDescription)
                complition(nil)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                complition(objects)
            } catch let error {
                print("Failed to decode JSON", error)
                complition(nil)
            }
        }
    }
}

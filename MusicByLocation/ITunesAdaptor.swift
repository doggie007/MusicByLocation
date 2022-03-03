//
//  ItunesAdaptor.swift
//  MusicByLocation
//
//  Created by Tcheng, James (BJH) on 03/03/2022.
//

import Foundation

class ItunesAdaptor{
    let baseUrl = "https://itunes.apple.com"
    
    func getArtists(search: String, completion: @escaping ([Artist]?) -> Void){
        
        let path = "/search?term=\(search)&entity=musicArtist".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: baseUrl + path)
        else{
            print("Invalid URL")
            completion(nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data{
                if let response = self.parseJson(json: data){
                    completion(response.results)
                }else{
                    completion(nil)
                }
            }
        }.resume()
    }
    
    
    func parseJson(json: Data) -> ArtistResponse?{
        let decoder = JSONDecoder()
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json){
            return artistResponse
        } else{
            print("Error decoding JSON")
            return nil
        }
//        do catch method
//        do{
//            let artistResponse = try decoder.decode(ArtistResponse.self, from: json)
//            return artistResponse
//        } catch{
//            print("Error decoding JSON")
//            return nil
//        }
    }
    
}

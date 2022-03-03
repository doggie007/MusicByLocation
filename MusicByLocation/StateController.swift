//
//  StateController.swift
//  MusicByLocation
//
//  Created by Tcheng, James (BJH) on 27/02/2022.
//

import Foundation

class StateController: ObservableObject{
    let locationHandler = LocationHandler()
    let iTunesAdaptor = ItunesAdaptor()
    @Published var artistsByLocation: [String] = []
    
    var lastKnownLocation: String = "" {
        didSet{
            iTunesAdaptor.getArtists(search: lastKnownLocation, completion: updateArtistsByLocation)
        }
    }
    
    func findMusic(){
        locationHandler.requestLocation()
    }
    func requestAccessToLocationData(){
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func updateArtistsByLocation(artists: [Artist]?){
        let names = artists?.map{
            return $0.name
        }
        DispatchQueue.main.async{
//            self.artistsByLocation = names?.joined(separator: ", ") ?? "Error finding Artists from your location"
            self.artistsByLocation = names ?? ["Error finding Artists from your location"]
        }
    }
    
}

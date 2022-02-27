//
//  Artist.swift
//  MusicByLocation
//
//  Created by Tcheng, James (BJH) on 27/02/2022.
//

import Foundation

struct Artist: Codable{
    var name: String
    private enum CodingKeys: String, CodingKey{
        case name = "artistName"
    }
}

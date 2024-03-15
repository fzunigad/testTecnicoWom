//
//  Song.swift
//  testTecnicoWom
//
//  Created by Francisco Zuniga De Spirito on 15-03-24.
//

import Foundation



struct Songs: Codable {
    var results: [Song]
}

struct Song: Codable, Hashable {
    var id:Int
    var image:String
    var title:String
    var artist: String
    var album: String
    var isFavorited: Bool?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    init(id: Int, image: String, title: String, artist: String, album: String, isFavorited: Bool) {
        self.id = id
        self.image = image
        self.title = title
        self.artist = artist
        self.album = album
        self.isFavorited = isFavorited
    }
    
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.id == rhs.id
    }
    
    enum CodingKeys: String, CodingKey {
        case image = "artworkUrl100"
        case title = "trackName"
        case id = "trackId"
        case artist = "artistName"
        case album = "collectionName"
    }
    
}



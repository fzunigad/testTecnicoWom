//
//  songFetch.swift
//  testTecnicoWom
//
//  Created by Francisco Zuniga De Spirito on 15-03-24.
//

import Foundation


func fetchSongs(store: String) async -> [Song] {
    // call api
    let urlString = "https://itunes.apple.com/search?term=pop&country=\(store)&entity=song&limit=10"

    guard let url = URL(string: urlString) else {
        return [Song]()
    }

    do {
    let (data, _) = try await URLSession.shared.data(from: url)
    return parse(json: data)
        
    } catch {
        //handle error
        print(error)
    }
    
    return [Song]()
}

func fetchTopPopSongsFromStores(stores: [String]) async -> [Song] {
    var songs = [Song]()
    
    for store in stores {
        songs.append(contentsOf:await fetchSongs(store: store))
    }
    
    let uniqueSongs = Set(songs)
    songs = Array(uniqueSongs)
    
    return songs
}

func parse(json: Data) -> [Song] {
    print(json)
    var songs = [Song]()
    let decoder = JSONDecoder()

    if let jsonSongs = try? decoder.decode(Songs.self, from: json) {
        songs = jsonSongs.results
        return songs
    } else {
        return songs
    }
}

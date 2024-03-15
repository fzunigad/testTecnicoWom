//
//  SongDetailViewController.swift
//  testTecnicoWom
//
//  Created by Francisco Zuniga De Spirito on 15-03-24.
//

import UIKit

class SongDetailViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    var song = Song(id: 0, image: "", title: "", artist: "", album: "", isFavorited: false)
    var songs = [Song]()

    @IBOutlet weak var AlbumImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var favoriteNavBarItem: UIBarButtonItem!

    @IBAction func favoriteNavBarItemClicked(_ sender: UIBarButtonItem) {
        if song.isFavorited ?? false {
            favoriteNavBarItem.image = UIImage(systemName: "star")
            song.isFavorited = false
            
            songs.removeAll { item in
                song.id == item.id
            }
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(songs){
                defaults.set(encoded, forKey: "songs")
            }
        } else {
            favoriteNavBarItem.image = UIImage(systemName: "star.fill")
            song.isFavorited = true
            songs.append(song)
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(songs){
                defaults.set(encoded, forKey: "songs")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let objects = UserDefaults.standard.value(forKey: "songs") as? Data {
           let decoder = JSONDecoder()
           if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [Song] {
               songs = objectsDecoded
           }
        }
        
        if let url = URL(string: song.image) {
            AlbumImageView.load(url: url)
        }
        
        if songs.contains(where: {$0.id == song.id}) {
            song.isFavorited = true
            favoriteNavBarItem.image = UIImage(systemName: "star.fill")
        }
        
        titleLabel.text = song.title
        artistLabel.text = song.artist
        albumLabel.text = song.album
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

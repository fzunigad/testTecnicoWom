//
//  SongDetailViewController.swift
//  testTecnicoWom
//
//  Created by Francisco Zuniga De Spirito on 15-03-24.
//

import UIKit

class SongDetailViewController: UIViewController {
    
    var song = Song(id: 0, image: "", title: "", artist: "", album: "")

    @IBOutlet weak var AlbumImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: song.image) {
            AlbumImageView.load(url: url)
        }
        
        titleLabel.text = song.title
        artistLabel.text = song.artist
        albumLabel.text = song.album
       
        
        // Do any additional setup after loading the view.
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

//
//  FilmDetailViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Arin Halicki on 1/23/18.
//  Copyright © 2018 Arin Halicki. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {
    
     weak var delegate: FilmDetailViewControllerDelegate?
    
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var openingCrawl: UILabel!
    
    var filmDetail: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(filmDetail![0])
        filmTitle.text = filmDetail![0]
        releaseDate.text = filmDetail![1]
        director.text = filmDetail![2]
        openingCrawl.text = filmDetail![3]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        delegate?.backButtonPressed(by: self)
        
    }
    
}

//
//  PeopleDetailViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Arin Halicki on 1/23/18.
//  Copyright © 2018 Arin Halicki. All rights reserved.
//

import UIKit

class PeopleDetailViewController: UIViewController {
    
    weak var delegate: PeopleDetailViewControllerDelegate?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var birthYear: UILabel!
    @IBOutlet weak var mass: UILabel!
    
    var personDetail: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(personDetail![0])
        name.text = personDetail![0]
        gender.text = personDetail![1]
        birthYear.text = personDetail![2]
        mass.text = personDetail![3]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        delegate?.backButtonPressed(by: self)
        
    }
    
}

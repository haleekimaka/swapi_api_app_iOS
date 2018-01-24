//
//  PeopleViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Arin Halicki on 1/23/18.
//  Copyright © 2018 Arin Halicki. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController, PeopleDetailViewControllerDelegate {

    

    var people = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllPeople(completionHandler: {
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] {
                        let resultsArray = results as! NSArray
                        for result in 0..<resultsArray.count {
                            self.people.append((resultsArray[result] as AnyObject) as! NSDictionary)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = people[indexPath.row]["name"] as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        performSegue(withIdentifier: "showCharacterDetailSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender is IndexPath {
            let destination = segue.destination as! PeopleDetailViewController
            destination.delegate = self
            
            let indexPath =  sender as! IndexPath
            print("indexPath[1] = ",indexPath[1])
            let name = people[indexPath[1]]["name"] as? String
            let gender = people[indexPath[1]]["gender"] as? String
            let birthYear = people[indexPath[1]]["birth_year"] as? String
            let mass = people[indexPath[1]]["mass"] as? String
            
            print(name!, gender!, birthYear!, mass!)
            
            print("Destination: ",destination)
            destination.personDetail = [name!, gender!, birthYear!, mass!]
        }
            
        else {
            let destination = segue.destination as! PeopleDetailViewController
            destination.delegate = self
        }
    }
    
    func backButtonPressed(by controller: PeopleDetailViewController) {
        dismiss(animated: true, completion: nil)
    }

}


//
//  FilmViewController.swift
//  StarWarsEncyclopedia
//
//  Created by Arin Halicki on 1/23/18.
//  Copyright © 2018 Arin Halicki. All rights reserved.
//

import UIKit

class FilmViewController: UITableViewController, FilmDetailViewControllerDelegate {
    
    var films = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllFilms(completionHandler: {
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] {
                        let resultsArray = results as! NSArray
                        for result in 0..<resultsArray.count {
                            self.films.append((resultsArray[result] as AnyObject) as! NSDictionary)
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
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = films[indexPath.row]["title"] as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        performSegue(withIdentifier: "showFilmDetailSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender is IndexPath {
            let destination = segue.destination as! FilmDetailViewController
            destination.delegate = self

            let indexPath =  sender as! IndexPath
            print("indexPath[1] = ",indexPath[1])
            let filmTitle = films[indexPath[1]]["title"] as? String
            let releaseDate = films[indexPath[1]]["release_date"] as? String
            let director = films[indexPath[1]]["director"] as? String
            let openingCrawl = films[indexPath[1]]["opening_crawl"] as? String
            
            print(filmTitle!, releaseDate!, director!, openingCrawl!)
            
            print("Destination: ",destination)
            destination.filmDetail = [filmTitle!, releaseDate!, director!, openingCrawl!]
        }
        
        else {
            let destination = segue.destination as! FilmDetailViewController
            destination.delegate = self
        }
    }
    
    func backButtonPressed(by controller: FilmDetailViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

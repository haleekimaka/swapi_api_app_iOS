//
//  StarWarsModel.swift
//  StarWarsEncyclopedia
//
//  Created by Arin Halicki on 1/23/18.
//  Copyright © 2018 Arin Halicki. All rights reserved.
//

import Foundation

class StarWarsModel {
    
    static func getAllPeople(completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: "https://swapi.co/api/people/")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    
    static func getAllFilms(completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: "https://swapi.co/api/films/")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    
    
}

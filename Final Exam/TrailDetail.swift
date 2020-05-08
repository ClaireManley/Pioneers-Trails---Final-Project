//
//  PokeDetail.swift
//  Final Exam
//
//  Created by Claire Manley on 4/27/20.
//  Copyright © 2020 Claire Manley. All rights reserved.
//

import Foundation
//var trail: Trail!
class TrailDetail {
    //var trail: Trail!
    var name = trail.stars
    var location = trail.location
    var length = trail.length
    var imgSmall = trail.imgSmall
    var url = "https://www.trailrunproject.com/data/get-trails?lat=40.0274&lon=-105.2519&maxDistance=10&key=200747983-8b9b590ebe38cbd1bd26c730bfab2cca"
    var stars = trail.stars
    
    
    
    private struct Returned: Codable {
        var name: String
        var location: String
        var length: Double
        var imgSmall: String
        var url: String
        //var sprites: Sprites
        
        
    }
    private struct Sprites: Codable {
        var front_default: String
        
    }
    
    func getData(completed: @escaping ()->()) {
          let urlString = url
          print("🕸 We are accessing the url \(urlString)")
          
          // Create a URL
          guard let url = URL(string: urlString) else {
              print("😡 ERROR: Could not create a URL from \(urlString)")
              completed()
              return
          }
          
          // Create Session
          let session = URLSession.shared
          
          // Get data with .dataTask method
          let task = session.dataTask(with: url) { (data, response, error) in
              if let error = error {
                  print("😡 ERROR: \(error.localizedDescription)")
              }
              
              // deal with the data
              do {
                  //let returned = try JSONDecoder().decode(Returned.self, from: data!)
                print("😎 Here is what was returned: \\(returned)")
                //self.name = trail.name
                //self.location = returned.location
                //self.length = returned.length
                //self.imageURL = returned.sprites.front_default
                
              } catch {
                  print("😡 JSON 2 ERROR!: \(error.localizedDescription)")
              }
              completed()
          }
          
          task.resume()
      }
}

//
//  DetailViewController.swift
//  Final Exam
//
//  Created by Claire Manley on 4/27/20.
//  Copyright © 2020 Claire Manley. All rights reserved.
//

import UIKit
var trail: Trail!
class DetailViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //var trail: Trail!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if trail == nil {
            trail = Trail(name: "", url: "", location: "", length: 0.0, imgSmall: "", stars: 0.0)
        }
        label1.text = trail.name
        nameLabel.text = ""
        locationLabel.text = ""
        lengthLabel.text = ""
        updateUserInterface()

    }
    
    func updateUserInterface() {
             let trailDetail = TrailDetail()
           trailDetail.url = "https://www.trailrunproject.com/data/get-trails?lat=40.0274&lon=-105.2519&maxDistance=10&key=200747983-8b9b590ebe38cbd1bd26c730bfab2cca"  //trail.url
           //pass pokemon url that goes to the detail page to Pokedetail
           trailDetail.getData {
               DispatchQueue.main.async {
                   self.locationLabel.text = "\(trailDetail.location)"
                   self.nameLabel.text = "\(trailDetail.name)"
                   self.lengthLabel.text = "\(trailDetail.length)"
                   
                   // get and display image
                //first check to see valid image
                guard let url = URL(string: trailDetail.imgSmall) else {
                self.imageView.image = UIImage(systemName: "blank.profile.image")
                return
               }
                do {
                    let data = try Data(contentsOf: url)
                    self.imageView.image = UIImage(data: data)
                } catch {
                    print("ERROR: error thrown trying to get image from URL \(url)")
                    
                }
           }
    }
}
}

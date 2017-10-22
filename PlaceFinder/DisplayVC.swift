//
//  DisplayVC.swift
//  PlaceFinder
//
//  Created by Nikola Sabelnik on 10/4/17.
//  Copyright © 2017 SabelnikN. All rights reserved.
//

import UIKit
import MapKit
import AlamofireImage

class DisplayVC: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var web: UILabel!
    @IBOutlet weak var workingTime: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var placePhoto: UIImageView!

   
    let annotation = MKPointAnnotation()
    var details : Details!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        setMap()
        setInfo()
        setImages()

        
        
    }
    
    

    @IBAction func searchMore(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    

    func setMap() {
        
        let latitude = details.latitude
        let longitude = details.longitude
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span = MKCoordinateSpanMake(latDelta, lonDelta)
        let location = CLLocationCoordinate2DMake(latitude!, longitude!)
        let region = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: false)
        
        annotation.coordinate = CLLocationCoordinate2D(latitude: details.latitude!, longitude: details.longitude!)
        
        mapView.addAnnotation(annotation)
        
    }

    
    
    func setInfo() {
        
        descriptionLbl.text = details.formattedAddres
        phone.text = details.internationalPhone
        rating.text = String(describing: details.rating!)
        web.text = details.website
        
        if details.open == true {
            workingTime.text = "OPEN"
        } else {
            workingTime.text = "CLOSED"
        }
        
        
    }
    
    
    func setImages() {
        
        if let url = URL(string: details.icon!) {
            icon.af_setImage(withURL: url)
        }
        
        if let url = URL(string: "\(photoBaseURL)\(photoMaxWidth)\(photoReferencee)\(details.photoReference!)\(photoKey)\(photoAPIKey)") {
            placePhoto.af_setImage(withURL: url)
        }
        
    }
    


}

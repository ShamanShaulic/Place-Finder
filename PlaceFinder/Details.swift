//
//  Details.swift
//  PlaceFinder
//
//  Created by Nikola Sabelnik on 10/8/17.
//  Copyright © 2017 SabelnikN. All rights reserved.
//

import Foundation


class Details {
    
    var longitude: Double?
    var latitude: Double?
    var formattedAddres: String?
    var internationalPhone: String?
    var rating: Double?
    var website: String?
    var open: Bool?
    var photoReference: String?
    var icon: String?
    
    

    init(longitude: Double, latitude: Double, formattedAddress: String, internationalPhone: String, rating: Double, website: String, open: Bool, photoReference: String, icon: String) {
        
        self.longitude = longitude
        self.latitude = latitude
        self.formattedAddres = formattedAddress
        self.internationalPhone = internationalPhone
        self.rating = rating
        self.website = website
        self.open = open
        self.photoReference = photoReference
        self.icon = icon
        
    }
    
    
}

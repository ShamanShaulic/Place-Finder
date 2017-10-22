//
//  CallAPI.swift
//  PlaceFinder
//
//  Created by Nikola Sabelnik on 10/7/17.
//  Copyright © 2017 SabelnikN. All rights reserved.
//

import Foundation
import Alamofire



class CallApi {
    
    
    static func getPlacesData(inputText: String)  {
        
        let currentURL = "\(autocompleteBaseURL)\(autocompleteInput)\(inputText)\(autocompleteKey)\(autocompleteAPIKey)"
        
        Alamofire.request(currentURL).responseJSON { response in
            
            let result = response.result
            if let json = result.value as? [String:Any] {
                
                if let predictions = json["predictions"] as? [[String:Any]] {
                    if let status = json["status"] as? String {
                        
                        if status == "OK" {
                            
                            if predictions.count > 0 {
                                
                                for i in 0...predictions.count - 1 {
                                    
                                    let descriptions = predictions[i]["description"] as? String
                                    
                                    let placeIds = predictions[i]["place_id"] as? String
                                    
                                    placeSearch = Place(descript: descriptions!, placeId: placeIds!)
                                    
                                    places.append(placeSearch)
                                    
                                }
                                
                            }
                            
                        }
                    }
                    
                }
            }
            
        }
        
    }
    
    
    static func getPlacesDetails(input: String, completionHandler: @escaping (_ details: Details) -> Void ) {
        
        
        let currentURL = "\(detailsBaseURL)\(detailsPlaceId)\(input)\(detailsKey)\(detailsAPIKey)"
        
        
        Alamofire.request(currentURL).responseJSON { response in
            
            let result = response.result
            
            if let json = result.value as? [String:Any] {
                
                if let result = json["result"] as? [String:Any] {
                    
                    if let status = json["status"] as? String {
                        
                        if status == "OK" {
                            
                            var formattedAddres = ""
                            
                            if let formatted_address = result["formatted_address"] as? String {
                                formattedAddres = formatted_address
                                print(formattedAddres)
                            }
                            
                            var InternationalPhone = ""
                            
                            if let international_phone = result["international_phone_number"] as? String {
                                InternationalPhone = international_phone
                                print(InternationalPhone)
                            }
                            
                            var rating = 0.0
                            
                            if let rate = result["rating"] as? Double {
                                rating = rate
                                print(rating)
                            }
                            
                            var website = ""
                            
                            if let web = result["website"] as? String {
                                website = web
                                print(website)
                            }
                            
                            var latitude = 0.0
                            var longitude = 0.0
                            
                            if let geometry = result["geometry"] as? [String:Any] {
                                if let location = geometry["location"] as? [String:Any] {
                                    if let lat = location["lat"] as? Double {
                                        latitude = lat
                                        print(latitude)
                                    }
                                    if let lng = location["lng"] as? Double {
                                        longitude = lng
                                        print(longitude)
                                    }
                                    
                                }
                            }
                            
                            var open = false
                            
                            if let openingHours = result["opening_hours"] as? [String:Any] {
                                if let openNow = openingHours["open_now"] as? Bool {
                                    open = openNow
                                    print(open)
                                }
                            }
                            
                            var photoReference = ""
                            
                            if let photos = result["photos"] as? [[String:Any]] {
                                if let photoRef = photos[0]["photo_reference"] as? String {
                                    photoReference = photoRef
                                    print(photoReference)
                                }
                            }
                            
                            var icon = ""
                            
                            if let ico = result["icon"] as? String {
                                icon = ico
                                print(icon)
                            }
                            
                            let detail = Details(longitude: longitude, latitude: latitude, formattedAddress: formattedAddres, internationalPhone: InternationalPhone, rating: rating, website: website, open: open, photoReference: photoReference , icon: icon)
                            
                            completionHandler(detail)
                            
                            
                        } else {
                            ServiceError.custom("OVER_QUERY_LIMIT")
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    
    
    
}

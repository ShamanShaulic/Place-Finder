//
//  SearchPlaceVC.swift
//  PlaceFinder
//
//  Created by Nikola Sabelnik on 10/3/17.
//  Copyright © 2017 SabelnikN. All rights reserved.
//

import UIKit
import Alamofire

class SearchPlaceVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var search: UISearchBar!
    
    var place: Place?
    var details : Details!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        table.isHidden = true
        search.delegate = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath) as! PlaceCell
        if inSearch {
            cell.placeDescription.text = filteredArray[indexPath.row].descript
        } else {
            cell.placeDescription.text = places[indexPath.row].descript
        }
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if inSearch {
            
            table.isHidden = false
            return filteredArray.count
            
        } else {
            
            table.isHidden = true
            return places.count
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let place = filteredArray[indexPath.row]
        
        CallApi.getPlacesDetails(input: place.placeId!) { (details) in
            self.details = details
            self.performSegue(withIdentifier: "onMap", sender: place)
        }
        
        
        
        
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "onMap" {
            
            if let destination = segue.destination as? DisplayVC {
                
                    destination.details = self.details

            }
            
        }
        
    }
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if search == nil || search.text == "" {
            
            inSearch = false
            
            self.table.reloadData()
            view.endEditing(true)
            
        } else {
            
            inSearch = true
            
            CallApi.getPlacesData(inputText: search.text!)
            
            let lower = search.text!.lowercased()
            
            filteredArray = places.filter({$0.descript?.lowercased().range(of: lower) != nil })
            
            table.reloadData()
            
        }
        
    }
    
    
}




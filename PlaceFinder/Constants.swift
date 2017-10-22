//
//  Constants.swift
//  PlaceFinder
//
//  Created by Nikola Sabelnik on 9/30/17.
//  Copyright © 2017 SabelnikN. All rights reserved.
//

import Foundation



/////////////Autocomplete////////////////


let autocompleteBaseURL = "https://maps.googleapis.com/maps/api/place/autocomplete/json"

let autocompleteInput = "?input="

let autoInput = "123+main+street"

let autocompleteKey = "&key="

let autocompleteAPIKey = "AIzaSyBolgNeDiqPZkqWFwsc0ZNgZk5qZ471V1c"

let autocompleteURL = "\(autocompleteBaseURL)\(autocompleteInput)\(autoInput)\(autocompleteKey)\(autocompleteAPIKey)"

/////////////Details////////////


let detailsBaseURL = "https://maps.googleapis.com/maps/api/place/details/json"

let detailsPlaceId = "?placeid="

let detailsInputPlaceID = "ChIJN1t_tDeuEmsRUsoyG83frY4"

let detailsKey = "&key="

let detailsAPIKey = "AIzaSyDVA9KQIjv27_twNyd0SZvx6i0B5WY3KEo"


let detailsURL = "\(detailsBaseURL)\(detailsPlaceId)\(detailsInputPlaceID)\(detailsKey)\(detailsAPIKey)"


///////////PHOTO///////////////



let photoBaseURL = "https://maps.googleapis.com/maps/api/place/photo"

let photoMaxWidth = "?maxwidth=200"

let photoReferencee = "&photoreference="

let photoInputs = "CnRtAAAATLZNl354RwP_9UKbQ_5Psy40texXePv4oAlgP4qNEkdIrkyse7rPXYGd9D_Uj1rVsQdWT4oRz4QrYAJNpFX7rzqqMlZw2h2E2y5IKMUZ7ouD_SlcHxYq1yL4KbKUv3qtWgTK0A6QbGh87GB3sscrHRIQiG2RrmU_jF4tENr9wGS_YxoUSSDrYjWmrNfeEHSGSc3FyhNLlBU"

let photoKey = "&key="

let photoAPIKey = "AIzaSyBRTLpnX3vRDWRFC78lTN6J1vJL2fVjtBE"


let photoURLs = "\(photoBaseURL)\(photoMaxWidth)\(photoReferencee)\(photoInputs)\(photoKey)\(photoAPIKey)"


////////////CONSTANTS///////////////


var inSearch = false

var filteredArray = [Place]()

var places = [Place]()

var placeSearch: Place!

var selectedIndexPath: IndexPath?








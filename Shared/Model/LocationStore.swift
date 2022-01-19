//
//  LocationStore.swift
//  TrekrMultiPlatform
//
//  Created by Harris-Stoertz, Rowan on 2022-01-18.
//

import Foundation

class LocationStore: ObservableObject {
    var places: [Location]
    
    init() {
        
        //get a pointer to the file
        let url = Bundle.main.url(forResource: "locations", withExtension: "json")!
        
        //load the contents of the JSON file
        let data = try! Data(contentsOf: url)
        
        //convert the data from the JSON file into the array
        places = try! JSONDecoder().decode([Location].self, from: data)
        
        //sort the list of places alphabetically by name, in ascending order
        places.sort(by: {
            $0.name < $1.name
        })
    }
}

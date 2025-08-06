//
//  Location.swift
//  SwiftUIMVVPMap
//
//  Created by Jesus Lara on 8/5/25.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
   
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    
    // Identifiable
    var id: String {
        // name = "ColosseumRome"
        // cityName = "Rome"
        // id = "ColosseumRome"
        name + cityName
    }
    
    // Equatable
    // This will use to compare the new value and old avalue is the same
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
}



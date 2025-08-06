//
//  LocationsViewModel.swift
//  SwiftUIMVVPMap
//
//  Created by Jesus Lara on 8/5/25.
//

import Foundation
import MapKit
import SwiftUI


class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    @Published var mapLocation: Location {
        didSet {
            // update map camera position if new map location is selected
            updateMapCameraPosition(location: mapLocation)
        }
    }
    
    
    @Published var mapCameraPosition: MapCameraPosition
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // show list of locations
    @Published var showLocationList: Bool = false
    
    // initialize the view model data
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.mapCameraPosition = .region(MKCoordinateRegion(center: locations.first!.coordinates, span: mapSpan))
        self.updateMapCameraPosition(location: locations.first!)
        
    }
    
    private func updateMapCameraPosition(location: Location) {
        withAnimation(.easeInOut) {
            mapCameraPosition = .region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        }
    }
    
    func toggleLocationList() {
        withAnimation(.easeInOut) {
            showLocationList = !showLocationList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            // if the location is clicked hide the list
            showLocationList = false
        }
    }
    
    func nextButtonPressed() {
        // get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation }) else {
            print("Could not find current index in locations array! Should never happen")
            return
        }
        
        // check if current index is valid
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else {
            // nextIndex is not valid
            // restart to 0 index
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        showNextLocation(location: locations[nextIndex])
        
    }
    
    
}

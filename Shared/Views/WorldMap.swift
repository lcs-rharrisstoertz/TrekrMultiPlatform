//
//  WorldMap.swift
//  TrekrMultiPlatform
//
//  Created by Harris-Stoertz, Rowan on 2022-01-19.
//

import MapKit
import SwiftUI

struct WorldMap: View {
    
    //get a reference to the location store
    //this is a derived value passed as a parameter
    //so, @ObservedObject
    @ObservedObject var store: LocationStore
    
    //center on LCS, wide enough to show most of Eastern North America
    @State var region = MKCoordinateRegion (center: CLLocationCoordinate2D(latitude: 44.43922, longitude: -78.26571), span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: store.places) {location in
            
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                
                NavigationLink (destination: LocationDetail(location: location)) {
                    
                    Image(location.country)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 80, height: 40)
                        .shadow(radius: 3)
                    
                }
                
            }
            
        }
            .navigationTitle("Map")
    }
}

struct WorldMap_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorldMap(store: testStore)
        }
    }
}
